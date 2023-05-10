import 'package:digital_portobello/mock.dart';
import 'package:digital_portobello/src/controllers/banners_controller.dart';
import 'package:flutter/material.dart';

import '../models/breadcrumb_item_model.dart';
import '../widgets/grid_items.dart';
import 'base_page.dart';

class ListProductsPage extends StatelessWidget {
  const ListProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'ESCOLHA O PRODUTO DESEJADO',
      futureBanners: fetchBanners(),
      itemsBreadCrumb: [
        BreadCrumbItemModel(name: 'Home', path: ''),
        BreadCrumbItemModel(name: 'Residencial', path: ''),
        BreadCrumbItemModel(name: 'Piso', path: ''),
        BreadCrumbItemModel(name: 'Banheiro', path: ''),
        BreadCrumbItemModel(name: 'Banheiro com Chuveiro', path: ''),
        BreadCrumbItemModel(name: 'Asa Delta Cement', path: ''),
      ],
      child: Column(children: [GridItems(items: Mock().products)]),
    );
  }
}
