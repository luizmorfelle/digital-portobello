import 'package:digital_portobello/mock.dart';
import 'package:digital_portobello/src/pages/base_page.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: "",
      images: Mock().images,
      itemsBreadCrumb: [],
      child: Placeholder(),
    );
  }
}
