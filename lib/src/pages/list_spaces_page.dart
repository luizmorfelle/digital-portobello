import 'package:digital_portobello/mock.dart';
import 'package:digital_portobello/src/models/breadcrumb_item_model.dart';
import 'package:digital_portobello/src/pages/base_page.dart';
import 'package:digital_portobello/src/widgets/grid_items.dart';
import 'package:digital_portobello/src/widgets/see_all_spaces_button.dart';
import 'package:flutter/material.dart';

class ListSpacesPage extends StatelessWidget {
  const ListSpacesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'SELECIONE SEU AMBIENTE',
      images: Mock().images,
      itemsBreadCrumb: [
        BreadCrumbItemModel(name: 'Home', path: ''),
        BreadCrumbItemModel(name: 'Residencial', path: ''),
        BreadCrumbItemModel(name: 'Piso', path: ''),
        BreadCrumbItemModel(name: 'Banheiro', path: '')
      ],
      child: Column(children: [
        GridItems(items: Mock().ambientesN2),
        const SeeAllSpacesButton()
      ]),
    );
  }
}
