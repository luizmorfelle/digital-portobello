import 'package:digital_portobello/src/utils/constants.dart';
import 'package:digital_portobello/src/controllers/banners_controller.dart';
import 'package:digital_portobello/src/controllers/products_controller.dart';
import 'package:digital_portobello/src/models/color_model.dart';
import 'package:digital_portobello/src/models/dropdown_model.dart';
import 'package:digital_portobello/src/models/material_model.dart';
import 'package:digital_portobello/src/models/space_n1_model.dart';
import 'package:digital_portobello/src/utils/translate.dart';
import 'package:digital_portobello/src/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../controllers/lines_controller.dart';
import '../controllers/spaces_controller.dart';
import '../models/breadcrumb_item_model.dart';
import '../models/product_line_model.dart';
import '../models/space_model.dart';
import '../widgets/custom_dropdown_button.dart';
import '../widgets/grid_items.dart';
import 'base_page.dart';

class ListLinesProductPage extends StatefulWidget {
  const ListLinesProductPage(
      {Key? key, this.spaceN1Id, this.materialName, this.futureLines})
      : super(key: key);
  final String? spaceN1Id;
  final String? materialName;
  final Future<List<LineProductModel>>? futureLines;

  @override
  State<ListLinesProductPage> createState() => _ListLinesProductPageState();
}

class _ListLinesProductPageState extends State<ListLinesProductPage> {
  late Future<List<LineProductModel>> futureLinesProduct;
  SpaceN1Model? actualSpaceN1;
  SpaceModel? previousSpace;
  List<DropDownModel> sortList = [
    DropDownModel('0', 'A - Z'),
    DropDownModel('1', 'Z - A'),
  ];
  List<LineProductModel>? linesProduct;
  List<LineProductModel>? fullLinesProduct;
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
    futureLinesProduct = widget.futureLines != null
        ? widget.futureLines!
        : widget.spaceN1Id == null
            ? fetchProductsLinesByMaterial(widget.materialName)
            : fetchProductsLinesBySpace(int.parse(widget.spaceN1Id!));

    futureLinesProduct.then((lines) {
      setState(() {
        linesProduct = lines;
        fullLinesProduct = lines;

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
    });

    if (widget.spaceN1Id != null) {
      fetchSpaceN1(int.parse(widget.spaceN1Id!)).then((actual) {
        fetchSpace(actual.ambientesID).then((previous) {
          futureLinesProduct.then((lines) {
            setState(() {
              actualSpaceN1 = actual;
              previousSpace = previous;
            });
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    void filterLines() {
      List<LineProductModel> newList = fullLinesProduct
              ?.where((it) => it.nome!.contains(controller.text))
              .toList() ??
          [];

      setState(() {
        linesProduct = newList;
      });
    }

    void sortLines(int value) {
      if (value == 0) {
        setState(() {
          linesProduct?.sort(
            (a, b) => a.nome!.compareTo(b.nome!),
          );
        });
      } else {
        setState(() {
          linesProduct?.sort(
            (a, b) => a.nome!.compareTo(b.nome!) * -1,
          );
        });
      }
    }

    return BasePage(
      title: tl('Escolha o produto desejado', context).toUpperCase(),
      futureBanners: actualSpaceN1 != null || widget.materialName != null
          ? fetchBannersSurface(
              spaceN1Id: actualSpaceN1?.id.toString() ?? "",
              material: widget.materialName ?? "")
          : null,
      futureObject: futureLinesProduct,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 900,
                  child: CustomTextField(
                    controller: controller,
                    suggestions: const [],
                    onChanged: (value) {
                      filterLines();
                    },
                  ),
                ),
                Wrap(
                  spacing: 35,
                  children: [
                    CustomDropdownButton(
                      items: sortList,
                      value: selectedSort!,
                      onChange: (value) {
                        setState(
                          () {
                            selectedSort = value;
                            sortLines(int.parse(value!.id));
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          GridItems(futureItems: futureLinesProduct)
        ],
      ),
    );
  }
}
