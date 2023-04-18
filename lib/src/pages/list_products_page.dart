import 'package:digital_portobello/mock.dart';
import 'package:digital_portobello/src/widgets/custom_app_bar.dart';
import 'package:digital_portobello/src/widgets/custom_drawer.dart';
import 'package:digital_portobello/src/widgets/slider_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';

class ListProductsPage extends StatelessWidget {
  const ListProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        drawer: const CustomDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SliderHeader(images: Mock().images),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.search),
                          hintText: 'Buscar',
                        ),
                      ),
                    ),
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                suffixIcon: Icon(Icons.search),
                                hintText: 'Buscar',
                              ),
                            ),
                          ),
                          Wrap(
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
                                items: <String>['Piso', 'Parede']
                                    .map((String value) {
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
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
