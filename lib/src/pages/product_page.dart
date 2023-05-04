import 'package:digital_portobello/mock.dart';
import 'package:digital_portobello/src/models/product_model.dart';
import 'package:digital_portobello/src/pages/base_page.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: "DETALHES DO PRODUTO",
      images: Mock().images,
      itemsBreadCrumb: const [],
      child: Column(
        children: [
          Flex(
            crossAxisAlignment: CrossAxisAlignment.start,
            direction: Axis.horizontal,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Image.asset(
                      Mock().products[0].imagem,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.favorite),
                          label: Text("Favoritar")),
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
                        'EXCLUSIVE ITEMS',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text('STORM GRAY',
                          style: Theme.of(context).textTheme.titleMedium),
                      SizedBox(
                        height: 40,
                      ),
                      Text('LOCAIS DE USO',
                          style: Theme.of(context).textTheme.titleLarge),
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.asset(Mock().products[0].imagem),
                                  Text('RE',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.asset(Mock().products[0].imagem),
                                  Text('RE',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.asset(Mock().products[0].imagem),
                                  Text('RE',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    Text('CARACTERÍESTICAS TÉCINAS',
                        style: Theme.of(context).textTheme.titleLarge),
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
                        itemCount: Mock().products[0].toJson().keys.length,
                        itemBuilder: (_, index) {
                          return SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    Mock()
                                        .products[0]
                                        .toJson()
                                        .keys
                                        .toList()[index],
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium),
                                Text(
                                    Mock()
                                        .products[0]
                                        .toJson()
                                        .values
                                        .toList()[index]!,
                                    style:
                                        Theme.of(context).textTheme.titleLarge),
                              ],
                            ),
                          );
                        })
                  ],
                ),
              )
            ],
          ),
          Table(
            border: TableBorder.all(),
            columnWidths: const {
              0: FractionColumnWidth(.8),
              1: FractionColumnWidth(.2),
            },
            children: [
              TableRow(children: [
                Text('Informações Técnicas'),
                Text(''),
              ]),
              TableRow(children: [
                TableCell(child: Text('Absorção de Água')),
                TableCell(child: Text('0')),
              ]),
              TableRow(children: [
                Text('Coeficiente de atrito molhado'),
                Text('0'),
              ]),
              TableRow(children: [
                Text('Indicação de Uso'),
                Text('0'),
              ]),
              TableRow(children: [
                Text('Resistência à Manchas'),
                Text('0'),
              ]),
              TableRow(children: [
                Text('Resistência ao ataque químico de BAIXA concentração'),
                Text('0'),
              ]),
              TableRow(children: [
                Text('Expansão por umidade'),
                Text('0'),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
