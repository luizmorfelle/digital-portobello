import 'package:auto_size_text/auto_size_text.dart';
import 'package:digital_portobello/src/models/banner_model.dart';
import 'package:digital_portobello/src/models/breadcrumb_item_model.dart';
import 'package:digital_portobello/src/providers/language_provider.dart';
import 'package:digital_portobello/src/utils/size.dart';
import 'package:digital_portobello/src/widgets/buttons/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_breadcrumb.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/slider_header.dart';

class BasePage extends StatelessWidget {
  final String title;
  final Future<List<BannerModel>>? futureBanners;
  final Future<Object> futureObject;
  final Widget child;
  final List<BreadCrumbItemModel> itemsBreadCrumb;

  const BasePage(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              SliderHeader(images: futureBanners),
              FutureBuilder(
                future: futureObject,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: AutoSizeText(
                                    title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge,
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                              if (!isSmall(context))
                                const Padding(
                                  padding: EdgeInsets.only(left: 16.0),
                                  child: CustomBackButton(),
                                ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          if (itemsBreadCrumb.isNotEmpty)
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: CustomBreadCrumb(
                                items: itemsBreadCrumb,
                              ),
                            ),
                          const SizedBox(
                            height: 10,
                          ),
                          child,
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
            Image.asset(
                'assets/images/banners_footer/${Provider.of<LanguageProvider>(context, listen: false).language.languageCode}.png')
          ],
        ),
      ),
    );
  }
}
