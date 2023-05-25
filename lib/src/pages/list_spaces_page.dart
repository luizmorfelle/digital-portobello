import 'package:digital_portobello/constants.dart';
import 'package:digital_portobello/src/controllers/banners_controller.dart';
import 'package:digital_portobello/src/controllers/spaces_controller.dart';
import 'package:digital_portobello/src/models/breadcrumb_item_model.dart';
import 'package:digital_portobello/src/models/space_home_model.dart';
import 'package:digital_portobello/src/models/space_n1_home_model.dart';
import 'package:digital_portobello/src/pages/base_page.dart';
import 'package:digital_portobello/src/widgets/grid_items.dart';
import 'package:digital_portobello/src/widgets/see_all_spaces_button.dart';
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
  SpaceHomeModel? actualSpace;

  @override
  void initState() {
    super.initState();
    futureSpaces = fetchSpacesN1Home(widget.spaceId);
    futureActualSpace = fetchSpaceHome(int.parse(widget.spaceId!));
    futureActualSpace.then((value) {
      setState(() {
        actualSpace = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'SELECIONE SEU AMBIENTE',
      futureBanners: actualSpace == null
          ? null
          : fetchBannersSurface(spaceId: actualSpace!.idAmbiente.toString()),
      futureObject: futureActualSpace,
      itemsBreadCrumb: actualSpace == null
          ? []
          : [
              BreadCrumbItemModel(name: 'Home', path: '/'),
              BreadCrumbItemModel(
                  name: usages
                      .firstWhere((it) => it.id == actualSpace?.idUso)
                      .value,
                  path: ''),
              BreadCrumbItemModel(
                  name: surfaces
                      .firstWhere((it) => it.id == actualSpace?.idSuperficie)
                      .value,
                  path: ''),
              BreadCrumbItemModel(name: actualSpace?.title, path: '')
            ],
      child: Column(children: [
        FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridItems(items: snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
          future: futureSpaces,
        ),
        const SeeAllSpacesButton()
      ]),
    );
  }
}
