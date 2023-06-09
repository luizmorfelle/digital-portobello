import 'package:digital_portobello/src/pages/list_lines_product_page.dart';
import 'package:digital_portobello/src/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';

import '../controllers/lines_controller.dart';
import '../utils/fields_tech_search.dart';
import 'base_tech_page.dart';

class TechLibraryPage extends StatefulWidget {
  const TechLibraryPage({Key? key}) : super(key: key);

  @override
  TechLibraryPageState createState() => TechLibraryPageState();
}

class TechLibraryPageState extends State<TechLibraryPage> {
  @override
  Widget build(BuildContext context) {
    return BaseTechPage(
      title: 'Biblioteca',
      subTitle: 'Técnica',
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [Text('Biblioteca Técnica'), CustomBackButton()],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
