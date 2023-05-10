import 'dart:convert';
import 'dart:ffi';

import 'package:digital_portobello/mock.dart';
import 'package:digital_portobello/src/models/banner_model.dart';
import 'package:digital_portobello/src/models/breadcrumb_item_model.dart';
import 'package:digital_portobello/src/models/space_model.dart';
import 'package:digital_portobello/src/models/usage_model.dart';
import 'package:digital_portobello/src/controllers/spaces_controller.dart';
import 'package:digital_portobello/src/widgets/custom_breadcrumb.dart';
import 'package:digital_portobello/src/widgets/custom_dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../controllers/banners_controller.dart';
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
  int selectedUsage = 1;
  int selectedSpace = 1;
  late Future<List<BannerModel>> futureBanners;
  late Future<List<SpaceModel>> futureSpaces;

  @override
  void initState() {
    super.initState();
    futureBanners = fetchBanners();
    futureSpaces = fetchSpaces(selectedUsage, selectedSpace);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(children: [
          SliderHeader(images: futureBanners),
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
                        CustomDropdownButton(
                          items: [
                            {1: 'Residencial'},
                            {2: 'Comercial'},
                            {3: 'Ver Todos'}
                          ],
                          value: selectedSpace.toString(),
                          onChange: (value) {
                            if (value == '3') {
                              context.push('/all-spaces');
                              return;
                            }
                            setState(() {
                              selectedSpace = int.parse(value!);
                              futureSpaces =
                                  fetchSpaces(selectedUsage, selectedSpace);
                            });
                          },
                        ),
                        CustomDropdownButton(
                          items: [
                            {1: 'Piso'},
                            {2: 'Parede'}
                          ],
                          value: selectedUsage.toString(),
                          onChange: (value) {
                            setState(() {
                              selectedUsage = int.parse(value!);
                              futureSpaces =
                                  fetchSpaces(selectedUsage, selectedSpace);
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
                FutureBuilder(
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SliderItems(itens: snapshot.data!);
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return CircularProgressIndicator();
                  },
                  future: futureSpaces,
                ),
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
