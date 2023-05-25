import 'package:digital_portobello/src/controllers/banners_controller.dart';
import 'package:digital_portobello/src/controllers/products_controller.dart';
import 'package:digital_portobello/src/models/breadcrumb_item_model.dart';
import 'package:digital_portobello/src/models/product_model.dart';
import 'package:digital_portobello/src/pages/base_page.dart';
import 'package:digital_portobello/src/providers/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
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
      title: "DETALHES DO PRODUTO",
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
                      .firstWhere((it) => it.id == previousSpace?.usoId)
                      .value,
                  path: ''),
              BreadCrumbItemModel(
                  name: surfaces
                      .firstWhere((it) => it.id == actualSpaceN1?.superficiesID)
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
                                  Provider.of<FavoriteProvider>(context,
                                          listen: false)
                                      .addFavoriteProduct(product!);
                                  context.push('/favorites');
                                },
                                icon: const Icon(Icons.favorite),
                                label: const Text("Favoritar")),
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
                            Text('LOCAIS DE USO',
                                style: Theme.of(context).textTheme.titleLarge),
                            Flex(
                              direction: Axis.horizontal,
                              children: product!.uso!
                                  .split(' ')
                                  .map((uso) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/icons/$uso.png',
                                              height: 70,
                                            ),
                                            Text(uso,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge),
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('CARACTERÍESTICAS TÉCINAS',
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
                                      Text(
                                          product!
                                              .toJson()
                                              .keys
                                              .toList()[index],
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium),
                                      Text(
                                          product!
                                                  .toJson()
                                                  .values
                                                  .toList()[index] ??
                                              "N/A",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge),
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
