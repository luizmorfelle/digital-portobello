import 'package:digital_portobello/src/models/material.dart';
import 'package:digital_portobello/src/widgets/custom_app_bar.dart';
import 'package:digital_portobello/src/widgets/custom_drawer.dart';
import 'package:digital_portobello/src/widgets/slider_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';

import '../widgets/slider_items.dart';

class SpacesListPage extends StatelessWidget {
  const SpacesListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> images = List.of([
      "CHARLESTON_BANNER_GRANDE_GW1MEYn.jpg",
      "GAIA_JADE_BANNER_GRANDE.jpg",
      "MALIBU_LAKE_BANNER_GRANDE.jpg",
      "VERANO_CIELO_BANNER_GRANDE.jpg"
    ]);
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "SELECIONE SEU AMBIENTE",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        ElevatedButton.icon(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(Icons.arrow_back),
                            label: Text('Voltar'))
                      ],
                    ),

                    //create a breadcrumb widget
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BreadCrumb(
                            items: <BreadCrumbItem>[
                              BreadCrumbItem(
                                  content: const Text('Residencial')),
                              BreadCrumbItem(content: const Text('Piso')),
                              BreadCrumbItem(content: const Text('Cozinha')),
                            ],
                            divider: const Icon(Icons.chevron_right),
                          ),
                        ]),
                    SliderItems(
                      itens: materiais,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
