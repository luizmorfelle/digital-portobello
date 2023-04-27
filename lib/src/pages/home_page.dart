import 'package:digital_portobello/mock.dart';
import 'package:digital_portobello/src/models/breadcrumb_item_model.dart';
import 'package:digital_portobello/src/widgets/custom_breadcrumb.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/see_all_spaces_button.dart';
import '../widgets/slider_header.dart';
import '../widgets/slider_items.dart';

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
        child: Column(children: [
          SliderHeader(images: Mock().images),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: CustomTextField(),
                ),
                Row(
                  children: [
                    Wrap(
                      spacing: 35,
                      children: [
                        Text(
                          'ESCOLHA OU SIMULE SEU AMBIENTE',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        DropdownButton<String>(
                          value: 'Residencial',
                          items: <String>['Residencial', 'Ma', 'M']
                              .map((String value) {
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
                              <String>['Piso', 'Ma', 'M'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (_) {},
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomBreadCrumb(items: [
                      BreadCrumbItemModel(name: 'Piso', path: ''),
                      BreadCrumbItemModel(name: 'Residencial', path: '')
                    ]),
                    const SeeAllSpacesButton()
                  ],
                ),
                SliderItems(itens: Mock().ambientes),
                const SizedBox(
                  height: 50,
                ),
                SliderItems(itens: Mock().materiais)
              ],
            ),
          )
        ]),
      ),
    );
  }
}
