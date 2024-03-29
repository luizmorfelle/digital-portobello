import 'package:digital_portobello/src/models/banner_model.dart';
import 'package:digital_portobello/src/utils/constants.dart';
import 'package:digital_portobello/src/controllers/banners_controller.dart';
import 'package:digital_portobello/src/controllers/spaces_controller.dart';
import 'package:digital_portobello/src/models/breadcrumb_item_model.dart';
import 'package:digital_portobello/src/models/space_home_model.dart';
import 'package:digital_portobello/src/models/space_n1_home_model.dart';
import 'package:digital_portobello/src/pages/base_page.dart';
import 'package:digital_portobello/src/utils/translate.dart';
import 'package:digital_portobello/src/widgets/grid_items.dart';
import 'package:digital_portobello/src/widgets/buttons/see_all_spaces_button.dart';
import 'package:flutter/material.dart';

class ListSpacesPage extends StatefulWidget {
  const ListSpacesPage({super.key, this.spaceId});

  final String? spaceId;

  @override
  State<ListSpacesPage> createState() => _ListSpacesPageState();
}

class _ListSpacesPageState extends State<ListSpacesPage> {
  late Future<List<SpaceN1HomeModel>> futureSpaces;
  late Future<SpaceHomeModel> futureActualSpace;
  late Future<List<BannerModel>> futureBanners;
  SpaceHomeModel? actualSpace;

  @override
  void initState() {
    super.initState();

    futureSpaces = fetchSpacesN1Home(widget.spaceId);
    futureActualSpace = fetchSpaceHome(int.parse(widget.spaceId!));
    futureBanners = fetchBannersSurface(spaceId: widget.spaceId);
    futureActualSpace.then((value) {
      setState(() {
        actualSpace = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: tl('select_your_ambient', context).toUpperCase(),
      futureBanners: futureBanners,
      futureObject: futureActualSpace,
      itemsBreadCrumb: actualSpace == null
          ? []
          : [
              BreadCrumbItemModel(name: 'Home', path: '/'),
              BreadCrumbItemModel(
                  name: usages
                      .firstWhere(
                          (it) => it.id == actualSpace?.idUso.toString())
                      .value,
                  path: ''),
              BreadCrumbItemModel(
                  name: surfaces
                      .firstWhere(
                          (it) => it.id == actualSpace?.idSuperficie.toString())
                      .value,
                  path: ''),
              BreadCrumbItemModel(name: actualSpace?.title, path: '')
            ],
      child: Column(children: [
        GridItems(
          futureItems: futureSpaces,
        ),
        SeeAllSpacesButton(
          surfaceId: actualSpace?.idSuperficie.toString(),
        )
      ]),
    );
  }
}
