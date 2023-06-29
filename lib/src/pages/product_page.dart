import 'package:digital_portobello/src/controllers/banners_controller.dart';
import 'package:digital_portobello/src/controllers/products_controller.dart';
import 'package:digital_portobello/src/models/breadcrumb_item_model.dart';
import 'package:digital_portobello/src/models/product_model.dart';
import 'package:digital_portobello/src/pages/base_page.dart';
import 'package:digital_portobello/src/providers/favorite_provider.dart';
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
    return BasePage(
      title: tl('product_detail', context).toUpperCase(),
      futureBanners: product == null && actualSpaceN1 == null
          ? null
          : fetchBannersSurface(
              spaceN1Id: actualSpaceN1?.id.toString() ?? "",
              products: '${product?.codProduto}${product?.sufixo}'),
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
      child: product == null
          ? const Center()
          : Column(
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
                      child: Column(
                        children: [
                          SizedBox(
                            height: 350,
                            child: Image.asset(
                              product!.imagem!,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                                onPressed: () {
                                  actualSpaceN1!.spaceModel = previousSpace;
                                  Provider.of<FavoriteProvider>(context,
                                          listen: false)
                                      .addFavoriteProduct(
                                          product!, actualSpaceN1!);
                                  context.push('/favorites');
                                },
                                icon: const Icon(Icons.favorite),
                                label: Text(tl('want_to_receive', context))),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        String url =
                                            'https://digital.portobello.com.br/?roomvoStartVisualizer=true&sku=${product!.codProduto}${product!.sufixo}&product_type=${actualSpaceN1?.superficiesID == 1 ? 'floor' : 'wall'}';

                                        return AlertDialog(
                                          title:
                                              Text(tl('recieve_list', context)),
                                          content: InkWell(
                                            onTap: () async =>
                                                await launchUrl(Uri.parse(url)),
                                            child: SizedBox(
                                              height: 400,
                                              width: 400,
                                              child: QrImageView(
                                                data: url,
                                                version: QrVersions.auto,
                                              ),
                                            ),
                                          ),
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(tl('close', context)),
                                            ),
                                          ],
                                        );
                                      });
                                },
                                icon: const Icon(Icons.qr_code),
                                label: Text(tl('simulate_here', context))),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product!.linha!,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(product!.descProduto!,
                                style: Theme.of(context).textTheme.titleMedium),
                            const SizedBox(
                              height: 40,
                            ),
                            Text(tl('material', context),
                                style: Theme.of(context).textTheme.titleLarge),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Flex(
                                direction: Axis.horizontal,
                                children: product!.uso!
                                    .split(' ')
                                    .map((uso) => Flexible(
                                          child: Container(
                                            constraints: BoxConstraints(
                                                maxHeight: 150, maxWidth: 150),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Flexible(
                                                    child: Image.asset(
                                                      'assets/icons/$uso.png',
                                                    ),
                                                  ),
                                                  Text(tl(uso, context),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleLarge),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Column(
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
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisExtent: 60,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                              ),
                              itemCount: product!.toJson().keys.length,
                              itemBuilder: (_, index) {
                                return SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FittedBox(
                                        child: Text(
                                            tl(
                                                product!
                                                    .toJson()
                                                    .keys
                                                    .toList()[index],
                                                context),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium),
                                      ),
                                      FittedBox(
                                        child: Text(
                                            tl(
                                                product!
                                                        .toJson()
                                                        .values
                                                        .toList()[index] ??
                                                    "N/A",
                                                context),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge),
                                      ),
                                    ],
                                  ),
                                );
                              })
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ProductTable(product: product!),
              ],
            ),
    );
  }
}
