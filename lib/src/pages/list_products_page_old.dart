// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:digital_portobello/src/controllers/banners_controller.dart';
// import 'package:digital_portobello/src/controllers/products_controller.dart';
// import 'package:digital_portobello/src/models/breadcrumb_item_model.dart';
// import 'package:digital_portobello/src/models/field_tech_search.dart';
// import 'package:digital_portobello/src/models/product_model.dart';
// import 'package:digital_portobello/src/utils/generate_breadcrumbs.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../controllers/spaces_controller.dart';
// import '../models/space_model.dart';
// import '../models/space_n1_model.dart';
// import '../providers/language_provider.dart';
// import '../utils/size.dart';
// import '../utils/translate.dart';
// import '../widgets/buttons/custom_back_button.dart';
// import '../widgets/custom_app_bar.dart';
// import '../widgets/custom_breadcrumb.dart';
// import '../widgets/custom_drawer.dart';
// import '../widgets/grid_items.dart';
// import '../widgets/slider_header.dart';

// class ListProductsPageOLD extends StatefulWidget {
//   const ListProductsPageOLD(
//       {Key? key,
//       this.spaceN1Id,
//       this.lineId,
//       this.products,
//       this.groupId,
//       this.fieldsTechSearch})
//       : super(key: key);
//   final List<ProductModel>? products;
//   final String? spaceN1Id;
//   final String? lineId;
//   final String? groupId;
//   final List<FieldTechSearch>? fieldsTechSearch;
//   @override
//   State<ListProductsPageOLD> createState() => _ListProductsPageOLDState();
// }

// class _ListProductsPageOLDState extends State<ListProductsPageOLD> {
//   SpaceN1Model? actualSpaceN1;
//   SpaceModel? previousSpace;
//   late List<BreadCrumbItemModel> itemsBreadCrumb;

//   @override
//   void initState() {
//     super.initState();
//     if (widget.spaceN1Id != null) {
//       fetchSpaceN1(int.parse(widget.spaceN1Id!)).then((actual) {
//         fetchSpace(actual.ambientesID).then((previous) {
//           setState(() {
//             itemsBreadCrumb = generateBreadcrumbs(previous, actual);

//             actualSpaceN1 = actual;
//             previousSpace = previous;
//           });
//         });
//       });
//     }
//   }

//   Future<List<ProductModel>> fetchListProducts(BuildContext context) async {
//     if (widget.products != null) {
//       return Future.value(widget.products);
//     } else {
//       if (widget.lineId != null) {
//         return widget.spaceN1Id == null
//             ? fetchProductsByLine(widget.lineId, context)
//             : fetchProductsByLineAndSpace(
//                 widget.lineId, widget.spaceN1Id, context);
//       } else {
//         if (widget.fieldsTechSearch != null) {
//           return widget.spaceN1Id == null
//               ? fetchProductsByGroupFilters(
//                   widget.groupId, widget.fieldsTechSearch, context)
//               : fetchProductsByGroupAndSpaceFilters(widget.groupId,
//                   widget.spaceN1Id, widget.fieldsTechSearch, context);
//         } else {
//           return widget.spaceN1Id == null
//               ? fetchProductsByGroup(widget.groupId, context)
//               : fetchProductsByGroupAndSpace(
//                   widget.groupId, widget.spaceN1Id, context);
//         }
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomAppBar(),
//       drawer: const CustomDrawer(),
//       body: FutureBuilder(
//         future: fetchListProducts(context),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Text('${snapshot.error}');
//           } else if (!snapshot.hasData) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else {
//             var productsString = snapshot.data!
//                 .map((e) => '${e.codProduto}${e.sufixo}')
//                 .join(",");
//             return SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(children: [
//                     FutureBuilder(
//                       future: actualSpaceN1 == null
//                           ? fetchBannersSurface(
//                               spaceN1Id: actualSpaceN1!.id.toString(),
//                               products: productsString)
//                           : fetchBannersSurface(
//                               spaceN1Id: actualSpaceN1!.id.toString(),
//                               products: productsString),
//                       builder: (context, snapshot) {
//                         if (snapshot.hasError) {
//                           return Text('${snapshot.error}');
//                         } else if (!snapshot.hasData) {
//                           return const Center(
//                             child: CircularProgressIndicator(),
//                           );
//                         } else {
//                           return SliderHeader(
//                               images: Future.value(snapshot.data));
//                         }
//                       },
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 10, horizontal: 20),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Flexible(
//                                 child: FittedBox(
//                                   fit: BoxFit.scaleDown,
//                                   child: AutoSizeText(
//                                     tl('Escolha o produto desejado', context)
//                                         .toUpperCase(),
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .headlineLarge,
//                                     maxLines: 1,
//                                   ),
//                                 ),
//                               ),
//                               if (!isSmall(context))
//                                 const Padding(
//                                   padding: EdgeInsets.only(left: 16.0),
//                                   child: CustomBackButton(),
//                                 ),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           if (itemsBreadCrumb.isNotEmpty)
//                             FittedBox(
//                               fit: BoxFit.scaleDown,
//                               alignment: Alignment.centerLeft,
//                               child: CustomBreadCrumb(
//                                 items: itemsBreadCrumb,
//                               ),
//                             ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           GridItems(futureItems: Future.value(snapshot.data)),
//                         ],
//                       ),
//                     ),
//                   ]),
//                   Image.asset(
//                       'assets/images/banners_footer/${Provider.of<LanguageProvider>(context, listen: false).language.languageCode}.png')
//                 ],
//               ),
//             );
//           }
//         },
//       ),
//     );
//     // return FutureBuilder(
//     //   future: fetchListProducts(context),
//     //   builder: (context, snapshot) {
//     //     if (snapshot.hasError) {
//     //       return const Center(
//     //         child: Text('Erro ao carregar produtos'),
//     //       );
//     //     } else if (snapshot.hasData) {
//     //       return BasePage(
//     //         title: tl('Escolha o produto desejado', context).toUpperCase(),
//     //         futureBanners: fetchBannersSurface(
//     //             spaceN1Id: actualSpaceN1?.id.toString() ?? "",
//     //             products: products
//     //                 .map((e) => '${e.codProduto}${e.sufixo}')
//     //                 .join(",")),
//     //         futureObject: Future.value(products),
//     //         itemsBreadCrumb: generateBreadcrumbs(previousSpace, actualSpaceN1),
//     //         child: GridItems(futureItems: futureProducts),
//     //       );
//     //     } else {
//     //       return const Center(
//     //         child: CircularProgressIndicator(),
//     //       );
//     //     }
//     //   },
//     // );
//   }
// }
