import 'package:digital_portobello/src/controllers/products_controller.dart';
import 'package:digital_portobello/src/models/breadcrumb_item_model.dart';
import 'package:digital_portobello/src/models/product_model.dart';
import 'package:digital_portobello/src/providers/favorite_provider.dart';
import 'package:digital_portobello/src/widgets/custom_app_bar.dart';
import 'package:digital_portobello/src/widgets/custom_back_button.dart';
import 'package:digital_portobello/src/widgets/custom_breadcrumb.dart';
import 'package:digital_portobello/src/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late List<ProductModel> products;
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
                            'Favoritos',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),
                      Text('Você favoritou ${products.length} produtos!')
                    ],
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        Provider.of<FavoriteProvider>(context, listen: false)
                            .removeAllFavoriteProduct();
                      },
                      icon: const Icon(Icons.delete),
                      label: const Text('Excluir Todos'))
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
                        child: Text('Nenhum produto favoritado.',
                            style: Theme.of(context).textTheme.titleLarge),
                      ),
                    ],
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      var produto = products[index];
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
                                                    'assets/images${produto.zoomImage!}',
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                              Positioned.fill(
                                                  child: Align(
                                                alignment: Alignment.topRight,
                                                child: Checkbox(
                                                    value: produto.checked,
                                                    onChanged: (e) {
                                                      setState(() {
                                                        produto.checked = e!;
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
                                                  "${produto.linha!} - ${produto.descProduto}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                CustomBreadCrumb(items: [
                                                  BreadCrumbItemModel(
                                                      name: 'Piso', path: ''),
                                                  BreadCrumbItemModel(
                                                      name: 'Residencial',
                                                      path: ''),
                                                  BreadCrumbItemModel(
                                                      name: 'Banheiro',
                                                      path: ''),
                                                ])
                                              ],
                                            ),
                                            SizedBox(
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
                                                itemCount: produto
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
                                                            produto
                                                                    .toJson()
                                                                    .keys
                                                                    .toList()[
                                                                index],
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .titleMedium),
                                                        Text(
                                                            produto
                                                                    .toJson()
                                                                    .values
                                                                    .toList()[
                                                                index]!,
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
                                                          produto);
                                                },
                                                icon: const Icon(Icons.delete),
                                                label: const Text('Excluir'))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (products.indexOf(produto) == products.length - 1)
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: ElevatedButton.icon(
                                onPressed: products
                                            .where((element) => element.checked)
                                            .length <
                                        2
                                    ? null
                                    : () {
                                        context.push('/compare');
                                      },
                                icon: const Icon(Icons.compare_arrows),
                                label: const Text('Comparar'),
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
