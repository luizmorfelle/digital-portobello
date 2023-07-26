import 'package:digital_portobello/src/controllers/banners_controller.dart';
import 'package:digital_portobello/src/controllers/products_controller.dart';
import 'package:digital_portobello/src/models/banner_model.dart';
import 'package:digital_portobello/src/models/banner_surface_model.dart';
import 'package:digital_portobello/src/models/breadcrumb_item_model.dart';
import 'package:digital_portobello/src/models/product_model.dart';
import 'package:digital_portobello/src/pages/base_page.dart';
import 'package:digital_portobello/src/providers/favorite_provider.dart';
import 'package:digital_portobello/src/utils/size.dart';
import 'package:digital_portobello/src/utils/target.dart';
import 'package:digital_portobello/src/utils/translate.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/constants.dart';
import '../controllers/spaces_controller.dart';
import '../models/space_model.dart';
import '../models/space_n1_model.dart';
import '../widgets/dialogs/dialog_product_simulate.dart';
import '../widgets/product_table.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key, this.productId, this.spaceN1Id})
      : super(key: key);
  final String? productId;
  final String? spaceN1Id;
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late Future<ProductModel> futureProduct;
  Future<List<BannerModel>> futureBanner = Future(() => []);
  ProductModel? product;
  SpaceN1Model? actualSpaceN1;
  SpaceModel? previousSpace;

  @override
  void initState() {
    super.initState();
    futureProduct = fetchProduct(widget.productId);
    futureProduct.then((value) {
      setState(() {
        product = value;
      });
      futureBanner = fetchBannersSurface(
          spaceN1Id: widget.spaceN1Id,
          products: '${product?.codProduto}${product?.sufixo}');
    });

    if (widget.spaceN1Id != null) {
      fetchSpaceN1(int.parse(widget.spaceN1Id!)).then((actual) {
        fetchSpace(actual.ambientesID).then((previous) {
          setState(() {
            actualSpaceN1 = actual;
            previousSpace = previous;
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String urlQrCode = product == null
        ? ""
        : actualSpaceN1 == null
            ? 'https://digital.portobello.com.br/?roomvoStartVisualizer=true&sku=${product!.codProduto}${product!.sufixo}'
            : 'https://digital.portobello.com.br/?roomvoStartVisualizer=true&sku=${product!.codProduto}${product!.sufixo}&product_type=${actualSpaceN1?.superficiesID == 1 ? 'floor' : 'wall'}';

    return BasePage(
      title: tl('product_detail', context).toUpperCase(),
      futureBanners: futureBanner,
      futureObject: futureProduct,
      itemsBreadCrumb: previousSpace == null || actualSpaceN1 == null
          ? []
          : [
              BreadCrumbItemModel(name: 'Home', path: '/'),
              BreadCrumbItemModel(
                  name: usages
                      .firstWhere(
                          (it) => it.id == previousSpace?.usoId.toString())
                      .value,
                  path: ''),
              BreadCrumbItemModel(
                  name: surfaces
                      .firstWhere((it) =>
                          it.id == actualSpaceN1?.superficiesID.toString())
                      .value,
                  path: ''),
              BreadCrumbItemModel(name: previousSpace?.title, path: ''),
              BreadCrumbItemModel(name: actualSpaceN1?.title, path: ''),
            ],
      child: LayoutBuilder(builder: (context, contrainst) {
        if (product == null) return const Center();
        if (contrainst.maxWidth < 800) {
          return ProductPageMobile(
              product: product,
              actualSpaceN1: actualSpaceN1,
              previousSpace: previousSpace,
              urlQrCode: urlQrCode);
        } else if (contrainst.maxWidth < 1200) {
          return ProductPageTablet(
              product: product,
              actualSpaceN1: actualSpaceN1,
              previousSpace: previousSpace,
              urlQrCode: urlQrCode);
        } else {
          return ProductPageDesktop(
              product: product,
              actualSpaceN1: actualSpaceN1,
              previousSpace: previousSpace,
              urlQrCode: urlQrCode);
        }
      }),
    );
  }
}

class ProductPageTablet extends StatelessWidget {
  const ProductPageTablet({
    super.key,
    required this.product,
    required this.actualSpaceN1,
    required this.previousSpace,
    required this.urlQrCode,
  });

  final ProductModel? product;
  final SpaceN1Model? actualSpaceN1;
  final SpaceModel? previousSpace;
  final String urlQrCode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: FirstSectionProductPage(
                  product: product,
                  actualSpaceN1: actualSpaceN1,
                  previousSpace: previousSpace,
                  urlQrCode: urlQrCode),
            ),
            const SizedBox(width: 15),
            Expanded(child: SecondSectionProductPage(product: product)),
          ],
        ),
        const SizedBox(height: 20),
        ThirdSectionProductPage(product: product),
        const SizedBox(height: 20),
        ProductTable(product: product!),
      ],
    );
  }
}

class ProductPageMobile extends StatelessWidget {
  const ProductPageMobile({
    super.key,
    required this.product,
    required this.actualSpaceN1,
    required this.previousSpace,
    required this.urlQrCode,
  });

  final ProductModel? product;
  final SpaceN1Model? actualSpaceN1;
  final SpaceModel? previousSpace;
  final String urlQrCode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        FirstSectionProductPage(
            product: product,
            actualSpaceN1: actualSpaceN1,
            previousSpace: previousSpace,
            urlQrCode: urlQrCode),
        const SizedBox(height: 30),
        SecondSectionProductPage(product: product),
        const SizedBox(height: 20),
        ThirdSectionProductPage(product: product),
        const SizedBox(height: 20),
        ProductTable(product: product!),
      ],
    );
  }
}

class ProductPageDesktop extends StatelessWidget {
  const ProductPageDesktop({
    super.key,
    required this.product,
    required this.actualSpaceN1,
    required this.previousSpace,
    required this.urlQrCode,
  });

  final ProductModel? product;
  final SpaceN1Model? actualSpaceN1;
  final SpaceModel? previousSpace;
  final String urlQrCode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Flex(
          crossAxisAlignment: CrossAxisAlignment.start,
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: 2,
              child: FirstSectionProductPage(
                  product: product,
                  actualSpaceN1: actualSpaceN1,
                  previousSpace: previousSpace,
                  urlQrCode: urlQrCode),
            ),
            Expanded(
              flex: 2,
              child: SecondSectionProductPage(product: product),
            ),
            Expanded(
              flex: 7,
              child: ThirdSectionProductPage(product: product),
            ),
            if (product != null && product?.simulador == 'S')
              Expanded(
                  flex: 2,
                  child: FortySectionProductPage(urlQrCode: urlQrCode)),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        ProductTable(product: product!),
      ],
    );
  }
}

class FortySectionProductPage extends StatelessWidget {
  const FortySectionProductPage({
    super.key,
    required this.urlQrCode,
  });

  final String urlQrCode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(tl('simulate_here', context),
            style: Theme.of(context).textTheme.titleMedium),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: QrImageView(
            data: urlQrCode,
            version: QrVersions.auto,
          ),
        ),
      ],
    );
  }
}

class ThirdSectionProductPage extends StatelessWidget {
  const ThirdSectionProductPage({
    super.key,
    required this.product,
  });

  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(tl('tech_features', context),
            style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(
          height: 20,
        ),
        GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isSmall(context) ? 2 : 4,
              mainAxisExtent: 60,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: product!.toJson().keys.length,
            itemBuilder: (_, index) {
              var label = product!.toJson().keys.toList()[index];

              var value = product!.toJson().values.toList()[index];
              return SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: Text(tl(label, context),
                          style: Theme.of(context).textTheme.bodyLarge),
                    ),
                    FittedBox(
                      child: Text(
                          tl(
                              value == "N/A" ||
                                      value == null ||
                                      value == "" ||
                                      value == "null"
                                  ? "-"
                                  : value,
                              context),
                          style: Theme.of(context).textTheme.titleMedium),
                    ),
                  ],
                ),
              );
            })
      ],
    );
  }
}

class SecondSectionProductPage extends StatelessWidget {
  const SecondSectionProductPage({
    super.key,
    required this.product,
  });

  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product!.linha!,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(product!.descProduto!,
            style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(
          height: 40,
        ),
        Text(tl('material', context),
            style: Theme.of(context).textTheme.titleMedium),
        Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: product!.uso!
              .split(' ')
              .map((uso) => Flexible(
                    child: Container(
                      constraints: const BoxConstraints(
                        minHeight: 110,
                        maxHeight: 111,
                        maxWidth: 131,
                        minWidth: 130,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Flexible(
                              child: Image.asset(
                                'assets/icons/$uso.png',
                                height: 100,
                              ),
                            ),
                            Flexible(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FittedBox(
                                    child: Text(tl(uso, context),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Tooltip(
                                    message: tl(
                                        allUsages
                                            .firstWhere(
                                                (element) => element.id == uso)
                                            .value,
                                        context),
                                    child: const Icon(
                                      Icons.info,
                                      size: 12,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class FirstSectionProductPage extends StatelessWidget {
  const FirstSectionProductPage({
    super.key,
    required this.product,
    required this.actualSpaceN1,
    required this.previousSpace,
    required this.urlQrCode,
  });

  final ProductModel? product;
  final SpaceN1Model? actualSpaceN1;
  final SpaceModel? previousSpace;
  final String urlQrCode;

  @override
  Widget build(BuildContext context) {
    bool isFavorited = Provider.of<FavoriteProvider>(context)
        .favoriteProducts
        .containsKey(product);
    return Column(
      children: [
        SizedBox(
          height: 250,
          width: 250,
          child: Image.asset(
              errorBuilder: (context, error, stackTrace) => Image.network(
                    'https://media.portobello.com.br/${product!.imagem?.split('/')[3]}',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Placeholder();
                    },
                  ),
              product!.imagem ?? "",
              fit: BoxFit.contain),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
              onPressed: () {
                if (isFavorited) return;
                actualSpaceN1?.spaceModel = previousSpace;
                Provider.of<FavoriteProvider>(context, listen: false)
                    .addFavoriteProduct(product!, actualSpaceN1);
                context.push('/favorites');
              },
              icon: const Icon(Icons.favorite),
              label:
                  Text(tl(isFavorited ? 'liked' : 'want_to_receive', context))),
        ),
        const SizedBox(
          height: 10,
        ),
        if (product?.simulador == 'S')
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
                onPressed: () {
                  isWeb()
                      ? launchUrl(Uri.parse(urlQrCode))
                      : showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return DialogProductSimulate(urlQrCode: urlQrCode);
                          });
                },
                icon: const Icon(Icons.qr_code),
                label: Text(tl('simulate_here', context))),
          ),
      ],
    );
  }
}
