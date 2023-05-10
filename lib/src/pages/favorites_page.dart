import 'package:digital_portobello/mock.dart';
import 'package:digital_portobello/src/models/breadcrumb_item_model.dart';
import 'package:digital_portobello/src/widgets/custom_app_bar.dart';
import 'package:digital_portobello/src/widgets/custom_back_button.dart';
import 'package:digital_portobello/src/widgets/custom_breadcrumb.dart';
import 'package:digital_portobello/src/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
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
                          Icon(Icons.favorite),
                          Text(
                            'Favoritos',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),
                      Text('Você favoritou 2 produtos!')
                    ],
                  ),
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.delete),
                      label: Text('Excluir Todos'))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [CustomBackButton()],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                var produto = Mock().products[0];

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.grey[100]),
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
                                  Image.asset(produto.imagem!),
                                  Positioned.fill(
                                      child: Align(
                                    alignment: Alignment.topRight,
                                    child: Checkbox(
                                        value: false, onChanged: (_) {}),
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
                                          name: 'Residencial', path: ''),
                                      BreadCrumbItemModel(
                                          name: 'Banheiro', path: ''),
                                    ])
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  child: GridView.builder(
                                      physics: ScrollPhysics(),
                                      shrinkWrap: true,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        mainAxisExtent: 60,
                                        crossAxisSpacing: 10.0,
                                        mainAxisSpacing: 10.0,
                                      ),
                                      itemCount: produto.toJson().keys.length,
                                      itemBuilder: (_, index) {
                                        return SizedBox(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  produto
                                                      .toJson()
                                                      .keys
                                                      .toList()[index],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium),
                                              Text(
                                                  produto
                                                      .toJson()
                                                      .values
                                                      .toList()[index]!,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge),
                                            ],
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
