import 'package:digital_portobello/mock.dart';
import 'package:digital_portobello/src/widgets/card_item.dart';
import 'package:digital_portobello/src/widgets/custom_app_bar.dart';
import 'package:digital_portobello/src/widgets/custom_drawer.dart';
import 'package:digital_portobello/src/widgets/slider_header.dart';
import 'package:flutter/material.dart';

class ListProductsPage extends StatelessWidget {
  const ListProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(children: [
          SliderHeader(images: Mock().images),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ESCOLHA O PRODUTO DESEJADO",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    ElevatedButton.icon(
                        onPressed: () => {},
                        icon: const Icon(Icons.arrow_back),
                        label: const Text("Voltar")),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 700,
                        child: Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.search),
                              hintText: 'Buscar',
                            ),
                          ),
                        ),
                      ),
                      Wrap(
                        spacing: 20,
                        children: [
                          DropdownButton<String>(
                            value: 'Residencial',
                            items: <String>[
                              'Residencial',
                              'Comercial',
                              'Ver Todos'
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (_) {},
                          ),
                          DropdownButton<String>(
                            value: 'Piso',
                            items:
                                <String>['Piso', 'Parede'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (_) {},
                          )
                        ],
                      )
                    ]),
                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                    ),
                    itemCount: Mock().materiais.length,
                    itemBuilder: (_, index) {
                      return CardItem(cardItem: Mock().materiais[index]);
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                        onPressed: () => {},
                        icon: const Icon(Icons.view_compact_alt_outlined),
                        label: const Text("Mostar Todos"))
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
