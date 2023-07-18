import 'package:digital_portobello/src/controllers/banners_controller.dart';
import 'package:digital_portobello/src/controllers/groups_controller.dart';
import 'package:digital_portobello/src/models/color_model.dart';
import 'package:digital_portobello/src/models/dropdown_model.dart';
import 'package:digital_portobello/src/models/field_tech_search.dart';
import 'package:digital_portobello/src/models/group_product_model.dart';
import 'package:digital_portobello/src/models/material_model.dart';
import 'package:digital_portobello/src/models/space_n1_model.dart';
import 'package:digital_portobello/src/utils/constants.dart';
import 'package:digital_portobello/src/utils/translate.dart';
import 'package:digital_portobello/src/widgets/custom_text_field_products.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

import '../controllers/spaces_controller.dart';
import '../models/breadcrumb_item_model.dart';
import '../models/space_model.dart';
import '../widgets/card_item.dart';
import '../widgets/custom_dropdown_button.dart';
import 'base_page.dart';

class ListGroupsProductPage extends StatefulWidget {
  const ListGroupsProductPage(
      {Key? key, this.spaceN1Id, this.materialName, this.fieldsTechSearch})
      : super(key: key);
  final String? spaceN1Id;
  final String? materialName;
  final List<FieldTechSearch>? fieldsTechSearch;

  @override
  State<ListGroupsProductPage> createState() => _ListGroupsProductPageState();
}

class _ListGroupsProductPageState extends State<ListGroupsProductPage> {
  Future<List<GroupProductModel>> futureGroupsProduct = Future(() => []);
  SpaceN1Model? actualSpaceN1;
  SpaceModel? previousSpace;
  final List<DropDownModel> sortList = [
    DropDownModel('0', 'A - Z'),
    DropDownModel('1', 'Z - A'),
  ];
  List<GroupProductModel>? groupsProducts;
  List<GroupProductModel>? fullGroupsProduct;
  List<DropDownModel> listMaterials = [];
  List<DropDownModel> listColors = [];
  DropDownModel? selectedSort;
  List<DropDownModel>? selectedMaterials = [];
  List<DropDownModel>? selectedColors = [];
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedSort = sortList.first;
    });

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

  Future<void> fetchGroups(BuildContext context) async {
    futureGroupsProduct = widget.fieldsTechSearch != null
        ? fetchProductsGroupsByFilter(widget.fieldsTechSearch!, context)
        : widget.spaceN1Id == null
            ? fetchProductsGroupsByMaterial(widget.materialName, context)
            : fetchProductsGroupsBySpace(int.parse(widget.spaceN1Id!), context);

    futureGroupsProduct.then((lines) {
      groupsProducts = lines;
      fullGroupsProduct = lines;

      listColors = lines
          .expand((element) => element.colors!)
          .toSet()
          .map((e) => ColorModel(id: e.hashCode, nome: e.toUpperCase()))
          .toList();
      listColors.sort(
        (a, b) => a.value.compareTo(b.value),
      );

      listMaterials = lines
          .expand((element) => element.materials!)
          .toSet()
          .map((e) => MaterialModel(id: e.hashCode, nome: e.toUpperCase()))
          .toList();
      listMaterials.sort(
        (a, b) => a.value.compareTo(b.value),
      );
      selectedMaterials!.addAll(listMaterials);
      selectedColors!.addAll(listColors);
    });
  }

  void filterGroups() {
    List<GroupProductModel> newList = fullGroupsProduct
            ?.where((it) => it.nome!.contains(controller.text))
            .toList() ??
        [];

    setState(() {
      groupsProducts = newList;
    });
  }

  void sortGroups(int value) {
    if (value == 0) {
      setState(() {
        groupsProducts?.sort(
          (a, b) => a.nome!.compareTo(b.nome!),
        );
      });
    } else {
      setState(() {
        groupsProducts?.sort(
          (a, b) => a.nome!.compareTo(b.nome!) * -1,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: tl('Escolha o produto desejado', context).toUpperCase(),
      futureBanners: actualSpaceN1 != null || widget.materialName != null
          ? fetchBannersSurface(
              spaceN1Id: actualSpaceN1?.id.toString() ?? "",
              material: widget.materialName ?? "")
          : null,
      futureObject: Future.wait(
        [
          fetchGroups(context),
        ],
      ),
      itemsBreadCrumb: previousSpace == null || actualSpaceN1 == null
          ? []
          : [
              BreadCrumbItemModel(name: 'Home', path: '/'),
              BreadCrumbItemModel(
                  name: usages
                      .firstWhere(
                          (it) => it.id == previousSpace?.usoId.toString())
                      .value,
                  path: ''),
              BreadCrumbItemModel(
                  name: surfaces
                      .firstWhere((it) =>
                          it.id == actualSpaceN1?.superficiesID.toString())
                      .value,
                  path: ''),
              BreadCrumbItemModel(name: previousSpace?.title, path: ''),
              BreadCrumbItemModel(name: actualSpaceN1?.title, path: ''),
            ],
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: CustomTextFieldProducts(
                    controller: controller,
                    suggestions: const [],
                    onChanged: (value) {
                      filterGroups();
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Wrap(
                  spacing: 35,
                  children: [
                    // MultiSelectDialogField(
                    //   listType: MultiSelectListType.CHIP,
                    //   dialogHeight: 300,
                    //   items: listMaterials
                    //       .map((e) => MultiSelectItem(e, e.value))
                    //       .toList(),
                    //   title: Text("Animals"),
                    //   selectedColor: Colors.black,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(7),
                    //     border: Border.all(
                    //       color: Colors.black26,
                    //     ),
                    //     color: Colors.white,
                    //   ),
                    //   buttonIcon: Icon(
                    //     Icons.arrow_drop_down_sharp,
                    //     color: Colors.black,
                    //   ),
                    //   buttonText: Text(
                    //     "Favorite Animals",
                    //     style: const TextStyle(
                    //       fontSize: 18,
                    //       fontWeight: FontWeight.bold,
                    //       color: Colors.black,
                    //     ),
                    //   ),
                    //   onConfirm: (results) {
                    //     //_selectedAnimals = results;
                    //   },
                    // ),
                    CustomDropdownButton(
                      items: sortList,
                      value: selectedSort!,
                      onChange: (value) {
                        setState(
                          () {
                            selectedSort = value;
                            sortGroups(int.parse(value!.id));
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: futureGroupsProduct,
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
                        });
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: SkeletonAvatar(
                              style: SkeletonAvatarStyle(
                                  height: cardItemSize, width: cardItemSize),
                            ),
                          )),
                    ),
                    child: Container());
              }
            },
          )
        ],
      ),
    );
  }
}
