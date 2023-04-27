import 'package:digital_portobello/src/widgets/custom_app_bar.dart';
import 'package:digital_portobello/src/widgets/custom_back_button.dart';
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
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          const Text('Pesquisa Técnica'),
          Row(
            children: const [
              Text('Selecione os filtros abaixo para apresentar os produtos'),
              CustomBackButton()
            ],
          ),
          Accordion(
            maxOpenSections: 1,
            children: [
              AccordionSection(
                header: const Text('Coeficiente de atrito molhado'),
                content: Row(
                  children: [
                    CheckboxMenuButton(
                        value: true,
                        onChanged: (e) => {},
                        child: const Text("0,3")),
                    CheckboxMenuButton(
                        value: true,
                        onChanged: (e) => {},
                        child: const Text("0,4")),
                    CheckboxMenuButton(
                        value: true,
                        onChanged: (e) => {},
                        child: const Text("0,5"))
                  ],
                ),
              ),
              AccordionSection(
                header: const Text('Local de Uso'),
                content: const Text('Content 2'),
              ),
              AccordionSection(
                header: const Text('Absorção de água'),
                content: const Text('Content 3'),
              ),
            ],
          ),
          Row(
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.clear),
                label: const Text('Limpar Filtros'),
                onPressed: () => {},
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
