import 'package:digital_portobello/mock.dart';
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
                      itens: Mock().ambientes,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
