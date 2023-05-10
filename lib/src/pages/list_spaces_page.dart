import 'package:digital_portobello/mock.dart';
import 'package:digital_portobello/src/controllers/spaces_controller.dart';
import 'package:digital_portobello/src/models/breadcrumb_item_model.dart';
import 'package:digital_portobello/src/pages/base_page.dart';
import 'package:digital_portobello/src/controllers/banners_controller.dart';
import 'package:digital_portobello/src/widgets/grid_items.dart';
import 'package:digital_portobello/src/widgets/see_all_spaces_button.dart';
import 'package:flutter/material.dart';

import '../models/space_n1_model.dart';

class ListSpacesPage extends StatefulWidget {
  const ListSpacesPage({Key? key}) : super(key: key);

  @override
  State<ListSpacesPage> createState() => _ListSpacesPageState();
}

class _ListSpacesPageState extends State<ListSpacesPage> {
  late Future<List<SpaceN1Model>> futureSpaces;

  @override
  void initState() {
    super.initState();
    futureSpaces = fetchSpacesN1(1, 1);
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'SELECIONE SEU AMBIENTE',
      futureBanners: fetchBanners(),
      itemsBreadCrumb: [
        BreadCrumbItemModel(name: 'Home', path: ''),
        BreadCrumbItemModel(name: 'Residencial', path: ''),
        BreadCrumbItemModel(name: 'Piso', path: ''),
        BreadCrumbItemModel(name: 'Banheiro', path: '')
      ],
      child: Column(children: [
        FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridItems(items: snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
          future: futureSpaces,
        ),
        const SeeAllSpacesButton()
      ]),
    );
  }
}
