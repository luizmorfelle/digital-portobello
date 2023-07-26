import 'package:digital_portobello/src/controllers/banners_controller.dart';
import 'package:digital_portobello/src/models/field_tech_search.dart';
import 'package:digital_portobello/src/models/space_n1_model.dart';
import 'package:digital_portobello/src/utils/constants.dart';
import 'package:digital_portobello/src/utils/generate_breadcrumbs.dart';
import 'package:digital_portobello/src/utils/translate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';

import '../controllers/products_controller.dart';
import '../controllers/spaces_controller.dart';
import '../models/banner_model.dart';
import '../models/product_model.dart';
import '../models/space_model.dart';
import '../providers/sales_channel_provider.dart';
import '../widgets/card_item.dart';
import 'base_page.dart';

class ListProductsPage extends StatefulWidget {
  const ListProductsPage(
      {Key? key,
      this.spaceN1Id,
      this.lineId,
      this.products,
      this.groupId,
      this.fieldsTechSearch})
      : super(key: key);
  final List<ProductModel>? products;
  final String? spaceN1Id;
  final String? lineId;
  final String? groupId;
  final List<FieldTechSearch>? fieldsTechSearch;

  @override
  State<ListProductsPage> createState() => _ListProductsPageState();
}

class _ListProductsPageState extends State<ListProductsPage> {
  Future<List<ProductModel>> futureListProducts = Future.wait([]);
  Future<List<BannerModel>> futureBanner = Future(() => []);
  late Future<SpaceN1Model> futureActualSpaceN1;
  late Future<SpaceModel> futurePreviousSpace;

  SpaceN1Model? actualSpaceN1;
  SpaceModel? previousSpace;
  List<ProductModel>? listProducts;

  @override
  void initState() {
    super.initState();
    if (widget.spaceN1Id != null) {
      futureActualSpaceN1 = fetchSpaceN1(int.parse(widget.spaceN1Id!));

      futureActualSpaceN1.then((actual) {
        futurePreviousSpace = fetchSpace(actual.ambientesID);

        futurePreviousSpace.then((previous) {
          setState(() {
            actualSpaceN1 = actual;
            previousSpace = previous;
          });
        });
      });
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      futureListProducts = fetchProducts(
          Provider.of<SalesChannelProvider>(context, listen: false)
              .getSaleChannel
              .id);
      futureListProducts.then((list) {
        setState(() {
          listProducts = list;
        });

        futureBanner = widget.spaceN1Id != null
            ? fetchBannersSurface(
                spaceN1Id: widget.spaceN1Id,
                products:
                    list.map((e) => '${e.codProduto}${e.sufixo}').join(","))
            : fetchBannersSurface(
                products:
                    list.map((e) => '${e.codProduto}${e.sufixo}').join(","));
      });
    });

    setState(() {});
  }

  Future<List<ProductModel>> fetchProducts(String cv) async {
    if (widget.products != null) {
      return Future.value(widget.products);
    } else {
      if (widget.lineId != null) {
        return widget.spaceN1Id == null
            ? fetchProductsByLine(widget.lineId, cv)
            : fetchProductsByLineAndSpace(widget.lineId, widget.spaceN1Id, cv);
      } else {
        if (widget.fieldsTechSearch != null) {
          return widget.spaceN1Id == null
              ? fetchProductsByGroupFilters(
                  widget.groupId, widget.fieldsTechSearch, cv)
              : fetchProductsByGroupAndSpaceFilters(widget.groupId,
                  widget.spaceN1Id, widget.fieldsTechSearch, cv);
        } else {
          return widget.spaceN1Id == null
              ? fetchProductsByGroup(widget.groupId, cv)
              : fetchProductsByGroupAndSpace(
                  widget.groupId, widget.spaceN1Id, cv);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: tl('Escolha o produto desejado', context).toUpperCase(),
      futureBanners: futureBanner,
      futureObject: futureListProducts,
      itemsBreadCrumb: generateBreadcrumbs(previousSpace, actualSpaceN1),
      child: Column(
        children: [
          FutureBuilder(
            future: futureListProducts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final items = snapshot.data!;
                return items.isEmpty
                    ? Text(tl('product_not_found', context))
                    : GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              MediaQuery.of(context).size.width ~/ cardItemSize,
                          mainAxisExtent: cardItemSize + textSpaceSize,
                          // childAspectRatio: 4 / 3,
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 20.0,
                        ),
                        itemCount: items.length,
                        itemBuilder: (_, index) {
                          return CardItem(
                            cardItem: items[index],
                            fieldTechSearch: widget.fieldsTechSearch,
                          );
                        },
                      );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error} - ${snapshot.stackTrace}'),
                );
              } else {
                return Skeleton(
                  isLoading: true,
                  skeleton: Row(
                    children: List.filled(
                        MediaQuery.of(context).size.width ~/ cardItemSize,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: SkeletonAvatar(
                            style: SkeletonAvatarStyle(
                                height: cardItemSize, width: cardItemSize - 16),
                          ),
                        )),
                  ),
                  child: Container(),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
