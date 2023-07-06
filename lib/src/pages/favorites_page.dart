import 'package:digital_portobello/src/models/breadcrumb_item_model.dart';
import 'package:digital_portobello/src/models/product_model.dart';
import 'package:digital_portobello/src/models/space_n1_model.dart';
import 'package:digital_portobello/src/providers/favorite_provider.dart';
import 'package:digital_portobello/src/widgets/custom_app_bar.dart';
import 'package:digital_portobello/src/widgets/custom_back_button.dart';
import 'package:digital_portobello/src/widgets/custom_breadcrumb.dart';
import 'package:digital_portobello/src/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/constants.dart';
import '../utils/translate.dart';

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

    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: Column(
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
                  ElevatedButton.icon(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            String url = '';
                            products.forEach((product, space) {
                              url += space != null
                                  ? '${product.codProduto}${product.sufixo}-${space.id}-${surfaces.firstWhere((it) => it.id == space.superficiesID.toString()).value}_${space.title}_${space.spaceModel!.title},'
                                  : '${product.codProduto}${product.sufixo}';
                            });
                            return AlertDialog(
                              title: Text(tl('recieve_list', context)),
                              content: InkWell(
                                onTap: () async => await launchUrl(Uri(
                                    scheme: 'https',
                                    host:
                                        'lb-pbg-app-408389648.us-east-1.elb.amazonaws.com',
                                    path: '/pdf',
                                    queryParameters: {'product': url})),
                                child: SizedBox(
                                  height: 400,
                                  width: 400,
                                  child: QrImageView(
                                    data:
                                        'https://lb-pbg-app-408389648.us-east-1.elb.amazonaws.com/pdf?product=$url',
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
                    label: Text(tl('export_list', context)),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Provider.of<FavoriteProvider>(context, listen: false)
                          .removeAllFavoriteProduct();
                    },
                    icon: const Icon(Icons.delete),
                    label: Text(tl('delete_all', context)),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [CustomBackButton()],
            ),
          ),
          products.isEmpty
              ? Container(
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
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      var productMap = products.entries.elementAt(index);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 450,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              child: Container(
                                decoration:
                                    BoxDecoration(color: Colors.grey[200]),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Flex(
                                    direction: Axis.horizontal,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Stack(
                                            children: [
                                              Positioned.fill(
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Image.asset(
                                                    'assets/images${productMap.key.zoomImage!}',
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                              Positioned.fill(
                                                  child: Align(
                                                alignment: Alignment.topRight,
                                                child: Checkbox(
                                                    value:
                                                        productMap.key.checked,
                                                    onChanged: (e) {
                                                      setState(() {
                                                        productMap.key.checked =
                                                            e!;
                                                      });
                                                    }),
                                              ))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "${productMap.key.linha!} - ${productMap.key.descProduto}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge,
                                                ),
                                              ],
                                            ),
                                            if (productMap.value != null)
                                              Row(
                                                children: [
                                                  CustomBreadCrumb(items: [
                                                    BreadCrumbItemModel(
                                                        name: surfaces
                                                            .firstWhere(
                                                              (it) =>
                                                                  it.id ==
                                                                  productMap
                                                                      .value!
                                                                      .superficiesID
                                                                      .toString(),
                                                            )
                                                            .value,
                                                        path: ''),
                                                    BreadCrumbItemModel(
                                                        name:
                                                            '${productMap.value!.spaceModel!.title}',
                                                        path: ''),
                                                    BreadCrumbItemModel(
                                                        name:
                                                            '${productMap.value!.title}',
                                                        path: ''),
                                                  ])
                                                ],
                                              ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            GridView.builder(
                                                physics: const ScrollPhysics(),
                                                shrinkWrap: true,
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 4,
                                                  mainAxisExtent: 60,
                                                  crossAxisSpacing: 10.0,
                                                  mainAxisSpacing: 10.0,
                                                ),
                                                itemCount: productMap.key
                                                    .toJson()
                                                    .keys
                                                    .length,
                                                itemBuilder: (_, index) {
                                                  return SizedBox(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            tl(
                                                                productMap.key
                                                                        .toJson()
                                                                        .keys
                                                                        .toList()[
                                                                    index],
                                                                context),
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyLarge),
                                                        Text(
                                                            tl(
                                                                productMap.key
                                                                            .toJson()
                                                                            .values
                                                                            .toList()[
                                                                        index] ??
                                                                    "-",
                                                                context),
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .titleLarge),
                                                      ],
                                                    ),
                                                  );
                                                }),
                                            ElevatedButton.icon(
                                                onPressed: () {
                                                  Provider.of<FavoriteProvider>(
                                                          context,
                                                          listen: false)
                                                      .removeFavoriteProduct(
                                                          productMap.key);
                                                },
                                                icon: const Icon(Icons.delete),
                                                label:
                                                    Text(tl('delete', context)))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (products.keys.toList().indexOf(productMap.key) ==
                              products.keys.length - 1)
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: ElevatedButton.icon(
                                onPressed: products.keys
                                            .where((element) => element.checked)
                                            .length <
                                        2
                                    ? null
                                    : () {
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
                ),
        ],
      ),
    );
  }
}
