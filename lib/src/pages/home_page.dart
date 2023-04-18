import 'package:digital_portobello/mock.dart';
import 'package:digital_portobello/src/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';

import '../widgets/custom_drawer.dart';
import '../widgets/slider_header.dart';
import '../widgets/slider_items.dart';

import '../models/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                    Text(
                      "ESCOLHA OU SIMULE SEU AMBIENTE",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 20,
                              children: [
                                BreadCrumb(
                                  items: <BreadCrumbItem>[
                                    BreadCrumbItem(
                                        content: const Text('Residencial')),
                                    BreadCrumbItem(content: const Text('Piso')),
                                  ],
                                  divider: const Icon(Icons.chevron_right),
                                ),
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
                              ]),
                          ElevatedButton.icon(
                              onPressed: () => {},
                              icon: const Icon(Icons.sync_alt),
                              label: const Text("Ver Todos")),
                        ]),
                    SliderItems(itens: Mock().ambientes),
                    const SizedBox(
                      height: 50,
                    ),
                    SliderItems(itens: Mock().materiais),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
