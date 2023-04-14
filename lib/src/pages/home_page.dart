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
    List<MaterialModel> materiais = List.of([
      MaterialModel(
        id: 1,
        imagem: 'assets/images/materiais/concreto.jpg',
        nome: 'Concreto',
      ),
      MaterialModel(
        id: 2,
        imagem: 'assets/images/materiais/madeira.jpg',
        nome: 'Madeira',
      ),
      MaterialModel(
        id: 3,
        imagem: 'assets/images/materiais/pedra.jpg',
        nome: 'Pedra',
      ),
      MaterialModel(
        id: 4,
        imagem: 'assets/images/materiais/argila.jpg',
        nome: 'Argila',
      ),
      MaterialModel(
        id: 5,
        imagem: 'assets/images/materiais/metal.jpg',
        nome: 'Metal',
      ),
      MaterialModel(
        id: 6,
        imagem: 'assets/images/materiais/marmore.jpg',
        nome: 'Mármore',
      ),
      MaterialModel(
        id: 7,
        imagem: 'assets/images/materiais/terrazzo.jpg',
        nome: 'Terrazzo',
      ),
      MaterialModel(
        id: 8,
        imagem: 'assets/images/materiais/sintetico.jpg',
        nome: 'Sintético',
      ),
      MaterialModel(
        id: 9,
        imagem: 'assets/images/materiais/quartzites.jpg',
        nome: 'Quartzites',
      ),
    ]);
    List<String> images = List.of([
      "CHARLESTON_BANNER_GRANDE_GW1MEYn.jpg",
      "GAIA_JADE_BANNER_GRANDE.jpg",
      "MALIBU_LAKE_BANNER_GRANDE.jpg",
      "VERANO_CIELO_BANNER_GRANDE.jpg"
    ]);

    return Scaffold(
        appBar: const CustomAppBar(),
        drawer: const CustomDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SliderHeader(images: images),
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
                    SliderItems(itens: materiais),
                    const SizedBox(
                      height: 50,
                    ),
                    SliderItems(itens: materiais),
                  ],
                ),
              ),
              SliderHeader(images: images),
            ],
          ),
        ));
  }
}
