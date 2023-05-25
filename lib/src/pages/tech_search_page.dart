import 'package:digital_portobello/src/models/field_tech_search.dart';
import 'package:digital_portobello/src/models/item_field_tech_search.dart';
import 'package:digital_portobello/src/pages/list_lines_product_page.dart';
import 'package:digital_portobello/src/widgets/custom_app_bar.dart';
import 'package:digital_portobello/src/widgets/custom_back_button.dart';
import 'package:digital_portobello/src/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';

import '../controllers/lines_controller.dart';
import '../utils/fields_tech_search.dart';
import 'base_tech_page.dart';

class TechSearchPage extends StatefulWidget {
  const TechSearchPage({Key? key}) : super(key: key);

  @override
  _TechSearchPageState createState() => _TechSearchPageState();
}

class _TechSearchPageState extends State<TechSearchPage> {
  @override
  Widget build(BuildContext context) {
    return BaseTechPage(
      title: 'Pesquisa',
      subTitle: 'Técnica',
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Selecione os filtros abaixo para apresentar os produtos'),
              CustomBackButton()
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ExpansionPanelList.radio(
            dividerColor: Colors.black,
            children: fieldsTechSearch
                .map((field) => ExpansionPanelRadio(
                    backgroundColor: Colors.grey[200],
                    value: field.id,
                    canTapOnHeader: true,
                    headerBuilder: (context, isExpanded) => ListTile(
                          title: Text(field.title,
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                          trailing: Text(
                            field.itens
                                .where((it) => it.checked)
                                .map((e) => e.value)
                                .join(', '),
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                    body: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: field.itens
                            .map(
                              (it) => CheckboxMenuButton(
                                  value: it.checked,
                                  onChanged: (event) {
                                    setState(() {
                                      it.checked = event!;
                                    });
                                  },
                                  child: Text(it.label)),
                            )
                            .toList(),
                      ),
                    )))
                .toList(),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.clear),
                label: const Text('Limpar Filtros'),
                onPressed: () => setState(() {
                  fieldsTechSearch.forEach((field) {
                    for (var item in field.itens) {
                      item.checked = false;
                    }
                  });
                }),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.search),
                label: const Text('Buscar'),
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListLinesProductPage(
                            futureLines:
                                fetchProductsLinesByFilter(fieldsTechSearch)),
                      ))
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

getFutureProducts(List<FieldTechSearch> fieldsTechSearch) {}
