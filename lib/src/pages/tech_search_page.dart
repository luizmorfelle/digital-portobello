import 'package:digital_portobello/src/widgets/custom_app_bar.dart';
import 'package:digital_portobello/src/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';

class TechSearchPage extends StatefulWidget {
  const TechSearchPage({Key? key}) : super(key: key);

  @override
  _TechSearchPageState createState() => _TechSearchPageState();
}

class _TechSearchPageState extends State<TechSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          Text('Pesquisa Técnica'),
          Row(
            children: [
              Text('Selecione os filtros abaixo para apresentar os produtos'),
              ElevatedButton.icon(
                icon: Icon(Icons.arrow_back),
                label: Text('Voltar'),
                onPressed: () => {},
              )
            ],
          ),
          Accordion(
            maxOpenSections: 1,
            children: [
              AccordionSection(
                header: Text('Coeficiente de atrito molhado'),
                content: Row(
                  children: [
                    CheckboxMenuButton(
                        value: true, onChanged: (e) => {}, child: Text("0,3")),
                    CheckboxMenuButton(
                        value: true, onChanged: (e) => {}, child: Text("0,4")),
                    CheckboxMenuButton(
                        value: true, onChanged: (e) => {}, child: Text("0,5"))
                  ],
                ),
              ),
              AccordionSection(
                header: Text('Local de Uso'),
                content: Text('Content 2'),
              ),
              AccordionSection(
                header: Text('Absorção de água'),
                content: Text('Content 3'),
              ),
            ],
          ),
          Row(
            children: [
              ElevatedButton.icon(
                icon: Icon(Icons.clear),
                label: Text('Limpar Filtros'),
                onPressed: () => {},
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.search),
                label: Text('Buscar'),
                onPressed: () => {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
