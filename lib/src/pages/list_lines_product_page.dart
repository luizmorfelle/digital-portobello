import 'package:digital_portobello/mock.dart';
import 'package:digital_portobello/src/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../models/breadcrumb_item_model.dart';
import '../widgets/grid_items.dart';
import 'base_page.dart';

class ListLinesProductPage extends StatefulWidget {
  const ListLinesProductPage({Key? key}) : super(key: key);

  @override
  State<ListLinesProductPage> createState() => _ListLinesProductPageState();
}

class _ListLinesProductPageState extends State<ListLinesProductPage> {
  String? selectedSpace;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'ESCOLHA O PRODUTO DESEJADO',
      images: Mock().images,
      itemsBreadCrumb: [
        BreadCrumbItemModel(name: 'Home', path: '/'),
        BreadCrumbItemModel(name: 'Residencial', path: ''),
        BreadCrumbItemModel(name: 'Piso', path: ''),
        BreadCrumbItemModel(name: 'Banheiro', path: ''),
        BreadCrumbItemModel(name: 'Banheiro com Chuveiro', path: ''),
      ],
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 900, child: CustomTextField()),
              Wrap(
                spacing: 35,
                children: [
                  DropdownButton<String>(
                    value: 'Material',
                    items: <String>['Material', 'Ma', 'M'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                  DropdownButton<String>(
                    value: 'Cores',
                    items: <String>['Cores', 'Ma', 'M'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                  DropdownMenu<String>(
                    initialSelection: 'az',
                    enableFilter: false,
                    enableSearch: false,
                    controller: null,
                    dropdownMenuEntries: [
                      DropdownMenuEntry(value: 'az', label: 'A - Z'),
                      DropdownMenuEntry(value: 'za', label: 'Z - A'),
                    ],
                    onSelected: (String? space) {
                      setState(() {
                        selectedSpace = space;
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
        GridItems(items: Mock().lines)
      ]),
    );
  }
}
