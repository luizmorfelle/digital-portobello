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
  final TextEditingController spaceController = TextEditingController();
  final TextEditingController useController = TextEditingController();
  String? selectedSpace;
  String? selectedUse;

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
                        DropdownMenu<String>(
                          initialSelection: 'RE',
                          enableFilter: false,
                          enableSearch: false,
                          controller: null,
                          inputDecorationTheme: InputDecorationTheme(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 10))),
                          dropdownMenuEntries: [
                            DropdownMenuEntry(
                                value: 'RE', label: 'Residencial'),
                            DropdownMenuEntry(value: 'CO', label: 'Comercial'),
                          ],
                          onSelected: (String? space) {
                            setState(() {
                              selectedSpace = space;
                            });
                          },
                        ),
                        DropdownMenu<String>(
                          initialSelection: 'PI',
                          enableFilter: false,
                          enableSearch: false,
                          controller: null,
                          dropdownMenuEntries: [
                            DropdownMenuEntry(value: 'PI', label: 'Piso'),
                            DropdownMenuEntry(value: 'PA', label: 'Parede'),
                          ],
                          onSelected: (String? use) {
                            setState(() {
                              selectedUse = use;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomBreadCrumb(items: [
                      BreadCrumbItemModel(name: 'Home', path: '/'),
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
