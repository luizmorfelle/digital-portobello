import 'package:digital_portobello/src/models/field_tech_search.dart';
import 'package:digital_portobello/src/pages/list_lines_product_page.dart';
import 'package:digital_portobello/src/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';

import '../controllers/lines_controller.dart';
import '../utils/fields_tech_search.dart';
import '../utils/translate.dart';
import 'base_tech_page.dart';

class TechSearchPage extends StatefulWidget {
  const TechSearchPage({Key? key}) : super(key: key);

  @override
  TechSearchPageState createState() => TechSearchPageState();
}

class TechSearchPageState extends State<TechSearchPage> {
  @override
  Widget build(BuildContext context) {
    return BaseTechPage(
      title: tl('advanced_search', context).split(' ')[0],
      subTitle: tl('advanced_search', context).split(' ')[1],
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(tl('select_filters', context)),
              const CustomBackButton()
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
                          title: Text(tl(field.title, context),
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                          trailing: Text(
                            field.itens
                                .where((it) => it.checked)
                                .map((e) => e.value)
                                .toSet()
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
                                  child: Text(tl(it.label, context))),
                            )
                            .toList(),
                      ),
                    )))
                .toList(),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.clear),
                label: Text(tl('reset_filter', context)),
                onPressed: () => setState(() {
                  for (var field in fieldsTechSearch) {
                    for (var item in field.itens) {
                      item.checked = false;
                    }
                  }
                }),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.search),
                label: Text(tl('search', context)),
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
