import 'package:digital_portobello/src/models/breadcrumb_item_model.dart';
import 'package:digital_portobello/src/models/product_model.dart';
import 'package:digital_portobello/src/models/space_n1_model.dart';
import 'package:digital_portobello/src/providers/favorite_provider.dart';
import 'package:digital_portobello/src/utils/size.dart';
import 'package:digital_portobello/src/utils/target.dart';
import 'package:digital_portobello/src/widgets/custom_app_bar.dart';
import 'package:digital_portobello/src/widgets/buttons/custom_back_button.dart';
import 'package:digital_portobello/src/widgets/custom_breadcrumb.dart';
import 'package:digital_portobello/src/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/constants.dart';
import '../utils/translate.dart';
import '../widgets/buttons/delete_all_button.dart';
import '../widgets/buttons/export_list_button.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late Map<ProductModel, SpaceN1Model?> products;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    products = Provider.of<FavoriteProvider>(context).getFavoriteProducts;
    String urlBase =
        'https://lb-pbg-app-408389648.us-east-1.elb.amazonaws.com/pdf?product=';
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.grey[300]),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.favorite),
                            Text(
                              tl('favorites', context),
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ],
                        ),
                        Text(
                            '${tl('your_favorites', context)} ${products.length} ${tl('your_favorites_2', context)}')
                      ],
                    ),
                    Wrap(
                      children: [
                        ExportListButton(products: products, urlBase: urlBase),
                        SizedBox(
                          width: 16,
                        ),
                        if (!isSmall(context)) const DeleteAllButton(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: isSmall(context)
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.end,
                children: [
                  if (isSmall(context)) const DeleteAllButton(),
                  const CustomBackButton()
                ],
              ),
            ),
            LayoutBuilder(builder: (context, contrainst) {
              if (products.isEmpty) {
                return Container(
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                            tl('Nenhum produto foi favoritado', context),
                            style: Theme.of(context).textTheme.titleLarge),
                      ),
                    ],
                  ),
                );
              } else if (contrainst.maxWidth < 800) {
                return FavoritesPageMobile(products: products);
              } else {
                return FavoritesPageDesktop(products: products);
              }
            }),
          ],
        ),
      ),
    );
  }
}

class FavoritesPageMobile extends StatefulWidget {
  const FavoritesPageMobile({Key? key, required this.products})
      : super(key: key);
  final Map<ProductModel, SpaceN1Model?> products;
  @override
  State<FavoritesPageMobile> createState() => _FavoritesPageMobileState();
}

class _FavoritesPageMobileState extends State<FavoritesPageMobile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: widget.products.length,
            itemBuilder: (context, index) {
              var productMap = widget.products.entries.elementAt(index);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: CardItemFavoritePage(
                            direction: Axis.vertical,
                            productMap: productMap,
                            onCheck: (value) {
                              setState(() {
                                productMap.key.checked = value;
                              });
                            },
                          )),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton.icon(
            onPressed: () {
              context.push('/compare');
            },
            icon: const Icon(Icons.compare_arrows),
            label: Text(tl('compare', context)),
          ),
        )
      ],
    );
  }
}

class FavoritesPageDesktop extends StatefulWidget {
  const FavoritesPageDesktop({Key? key, required this.products})
      : super(key: key);
  final Map<ProductModel, SpaceN1Model?> products;
  @override
  State<FavoritesPageDesktop> createState() => _FavoritesPageDesktopState();
}

class _FavoritesPageDesktopState extends State<FavoritesPageDesktop> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          var productMap = widget.products.entries.elementAt(index);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 450,
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: CardItemFavoritePage(
                      productMap: productMap,
                      onCheck: (value) {
                        setState(() {
                          productMap.key.checked = value;
                        });
                      },
                    )),
              ),
              if (widget.products.keys.toList().indexOf(productMap.key) ==
                  widget.products.keys.length - 1)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      context.push('/compare');
                    },
                    icon: const Icon(Icons.compare_arrows),
                    label: Text(tl('compare', context)),
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}

class CardItemFavoritePage extends StatelessWidget {
  const CardItemFavoritePage({
    super.key,
    required this.productMap,
    required this.onCheck,
    this.direction = Axis.horizontal,
  });

  final Function(bool) onCheck;
  final MapEntry<ProductModel, SpaceN1Model?> productMap;
  final Axis direction;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[200]),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Flex(
          direction: direction,
          children: [
            Expanded(
              flex: isSmall(context) ? 2 : 1,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          productMap.key.imagem ?? "",
                          errorBuilder: (context, error, stackTrace) =>
                              Image.network(
                            'https://media.portobello.com.br/${productMap.key.imagem?.split('/')[3]}',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Placeholder();
                            },
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Positioned.fill(
                        child: Align(
                      alignment: Alignment.topLeft,
                      child: Transform.scale(
                        scale: 1.5,
                        child: Checkbox(
                            value: productMap.key.checked,
                            onChanged: (e) {
                              onCheck(e!);
                            }),
                      ),
                    ))
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "${productMap.key.linha!} - ${productMap.key.descProduto}",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  if (productMap.value != null)
                    FittedBox(
                      child: CustomBreadCrumb(items: [
                        BreadCrumbItemModel(
                            name: surfaces
                                .firstWhere(
                                  (it) =>
                                      it.id ==
                                      productMap.value!.superficiesID
                                          .toString(),
                                )
                                .value,
                            path: ''),
                        BreadCrumbItemModel(
                            name: '${productMap.value!.spaceModel!.title}',
                            path: ''),
                        BreadCrumbItemModel(
                            name: '${productMap.value!.title}', path: ''),
                      ]),
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  GridView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isSmall(context) ? 2 : 4,
                        mainAxisExtent: 60,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemCount: productMap.key.toJson().keys.length,
                      itemBuilder: (_, index) {
                        var value =
                            productMap.key.toJson().values.toList()[index];
                        return SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                    tl(
                                        productMap.key
                                            .toJson()
                                            .keys
                                            .toList()[index],
                                        context),
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                    tl(
                                        value == "N/A" ||
                                                value == null ||
                                                value == "" ||
                                                value == "null"
                                            ? "-"
                                            : value,
                                        context),
                                    style:
                                        Theme.of(context).textTheme.titleLarge),
                              ),
                            ],
                          ),
                        );
                      }),
                  ElevatedButton.icon(
                      onPressed: () {
                        Provider.of<FavoriteProvider>(context, listen: false)
                            .removeFavoriteProduct(productMap.key);
                      },
                      icon: const Icon(Icons.delete),
                      label: Text(tl('delete', context)))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
