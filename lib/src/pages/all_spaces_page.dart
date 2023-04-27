import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';

class AllSpacesPage extends StatelessWidget {
  const AllSpacesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          Text('Todos os Ambientes'),
          Row(
            children: [
              Text('Selecione os filtros abaixo para apresentar os produtos'),
              BackButton()
            ],
          ),
          DropdownButton<String>(
            value: 'Piso',
            items: <String>['Piso', 'Parede'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          ),
          Accordion(
            maxOpenSections: 1,
            children: [
              AccordionSection(
                header: Text('Comercial'),
                content: Accordion(children: [
                  AccordionSection(
                    header: Text('Escritório'),
                    content: Text('Content 1'),
                  ),
                  AccordionSection(
                    header: Text('Loja'),
                    content: Text('Content 2'),
                  ),
                  AccordionSection(
                    header: Text('Restaurante'),
                    content: Text('Content 3'),
                  ),
                ]),
              ),
              AccordionSection(
                header: Text('Educacional'),
                content: Text('Content 2'),
              ),
              AccordionSection(
                header: Text('Hotelaria'),
                content: Text('Content 3'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
