import 'package:digital_portobello/src/controllers/banners_controller.dart';
import 'package:digital_portobello/src/controllers/products_controller.dart';
import 'package:digital_portobello/src/models/product_model.dart';
import 'package:digital_portobello/src/utils/generate_breadcrumbs.dart';
import 'package:flutter/material.dart';

import '../controllers/spaces_controller.dart';
import '../models/space_model.dart';
import '../models/space_n1_model.dart';
import '../utils/translate.dart';
import '../widgets/grid_items.dart';
import 'base_page.dart';

class ListProductsPage extends StatefulWidget {
  const ListProductsPage({Key? key, this.spaceN1Id, this.lineId, this.groupId})
      : super(key: key);
  final String? spaceN1Id;
  final String? lineId;
  final String? groupId;
  @override
  State<ListProductsPage> createState() => _ListProductsPageState();
}

class _ListProductsPageState extends State<ListProductsPage> {
  late Future<List<ProductModel>> futureProducts;
  SpaceN1Model? actualSpaceN1;
  SpaceModel? previousSpace;
  List<ProductModel> products = [];

  @override
  void initState() {
    super.initState();
    if (widget.spaceN1Id != null) {
      fetchSpaceN1(int.parse(widget.spaceN1Id!)).then((actual) {
        fetchSpace(actual.ambientesID).then((previous) {
          setState(() {
            actualSpaceN1 = actual;
            previousSpace = previous;
          });
        });
      });
    }
  }

  Future<void> fetchListProducts(BuildContext context) async {
    if (widget.lineId != null) {
      futureProducts = widget.spaceN1Id == null
          ? fetchProductsByLine(widget.lineId, context)
          : fetchProductsByLineAndSpace(
              widget.lineId, widget.spaceN1Id, context);
    } else {
      futureProducts = widget.spaceN1Id == null
          ? fetchProductsByGroup(widget.groupId, context)
          : fetchProductsByGroupAndSpace(
              widget.groupId, widget.spaceN1Id, context);
    }
    futureProducts.then((value) {
      products = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: tl('Escolha o produto desejado', context).toUpperCase(),
      futureBanners: actualSpaceN1 == null && products.isEmpty
          ? null
          : fetchBannersSurface(
              spaceN1Id: actualSpaceN1?.id.toString() ?? "",
              products:
                  products.map((e) => '${e.codProduto}${e.sufixo}').join(",")),
      futureObject: Future.wait(
        [
          fetchListProducts(context),
        ],
      ),
      itemsBreadCrumb: generateBreadcrumbs(previousSpace, actualSpaceN1),
      child: GridItems(futureItems: futureProducts),
    );
  }
}
