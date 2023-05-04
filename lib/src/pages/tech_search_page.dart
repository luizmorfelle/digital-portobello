import 'package:digital_portobello/src/models/field_tech_search.dart';
import 'package:digital_portobello/src/models/item_field_tech_search.dart';
import 'package:digital_portobello/src/widgets/custom_app_bar.dart';
import 'package:digital_portobello/src/widgets/custom_back_button.dart';
import 'package:digital_portobello/src/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';

import 'base_tech_page.dart';

class TechSearchPage extends StatefulWidget {
  const TechSearchPage({Key? key}) : super(key: key);

  @override
  _TechSearchPageState createState() => _TechSearchPageState();
}

class _TechSearchPageState extends State<TechSearchPage> {
  final List<FieldTechSearch> fields = [
    FieldTechSearch(id: 0, title: 'Coeficiente de atrito molhado', itens: [
      ItemFieldTechSearch(value: '0.3', label: '0,3'),
      ItemFieldTechSearch(value: '0.4', label: '0,4'),
      ItemFieldTechSearch(value: '0.5', label: '0,5'),
      ItemFieldTechSearch(value: '0.6', label: '0,6'),
    ]),
    FieldTechSearch(id: 0, title: 'Local de Uso', itens: [
      ItemFieldTechSearch(value: 'RI', label: 'RI'),
      ItemFieldTechSearch(value: 'PE', label: 'PE'),
      ItemFieldTechSearch(value: 'FA', label: 'FA'),
      ItemFieldTechSearch(value: 'RE', label: 'RE'),
      ItemFieldTechSearch(value: 'CL', label: 'CL'),
      ItemFieldTechSearch(value: 'CP', label: 'CP'),
    ]),
  ];

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
          Accordion(
            maxOpenSections: 1,
            openAndCloseAnimation: false,
            children: fields.map((field) {
              return AccordionSection(
                headerBackgroundColor: Colors.grey[200],
                rightIcon: Icon(Icons.arrow_downward),
                isOpen: true,
                header: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(field.title,
                        style: Theme.of(context).textTheme.titleMedium),
                    Text(field.itens
                        .where((element) => element.checked)
                        .map((e) => e.label)
                        .toList()
                        .join(', '))
                  ],
                ),
                content: Row(
                  children: field.itens.map((item) {
                    return CheckboxMenuButton(
                      value: item.checked,
                      onChanged: (value) =>
                          {setState(() => item.checked = value!)},
                      child: Text(item.label),
                    );
                  }).toList(),
                ),
              );
            }).toList(),
          ),
          Row(
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.clear),
                label: const Text('Limpar Filtros'),
                onPressed: () => setState(() {
                  fields.forEach((field) {
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
                onPressed: () => {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
