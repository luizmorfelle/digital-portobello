import 'package:digital_portobello/src/models/breadcrumb_item_model.dart';
import 'package:digital_portobello/src/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_breadcrumb.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/slider_header.dart';

class BasePage extends StatelessWidget {
  final String title;
  final List<String> images;
  final Widget child;
  final List<BreadCrumbItemModel> itemsBreadCrumb;

  const BasePage(
      {Key? key,
      required this.title,
      required this.images,
      required this.itemsBreadCrumb,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(children: [
          SliderHeader(images: images),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                      const Flexible(child: CustomBackButton()),
                    ],
                  ),
                ),
                if (itemsBreadCrumb.isNotEmpty)
                  Container(
                    alignment: Alignment.centerLeft,
                    child: CustomBreadCrumb(
                      items: itemsBreadCrumb,
                    ),
                  ),
                child
              ],
            ),
          )
        ]),
      ),
    );
  }
}
