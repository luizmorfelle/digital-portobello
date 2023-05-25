import 'package:digital_portobello/src/models/banner_model.dart';
import 'package:digital_portobello/src/models/breadcrumb_item_model.dart';
import 'package:digital_portobello/src/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';

import '../models/banner_home_model.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_breadcrumb.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/slider_header.dart';

class BasePage extends StatelessWidget {
  final String title;
  late Future<List<BannerModel>>? futureBanners;
  late Future<Object> futureObject;
  final Widget child;
  final List<BreadCrumbItemModel> itemsBreadCrumb;

  BasePage(
      {Key? key,
      required this.title,
      required this.futureBanners,
      required this.itemsBreadCrumb,
      required this.child,
      required this.futureObject})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(children: [
          SliderHeader(images: futureBanners),
          FutureBuilder(
            future: futureObject,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    children: [
                      Row(
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
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error} - ${snapshot.stackTrace}");
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ]),
      ),
    );
  }
}
