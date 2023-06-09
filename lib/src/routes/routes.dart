import 'package:digital_portobello/src/pages/all_spaces_page.dart';
import 'package:digital_portobello/src/pages/compare_page.dart';
import 'package:digital_portobello/src/pages/favorites_page.dart';
import 'package:digital_portobello/src/pages/home_page.dart';
import 'package:digital_portobello/src/pages/list_lines_product_page.dart';
import 'package:digital_portobello/src/pages/list_products_page.dart';
import 'package:digital_portobello/src/pages/list_spaces_page.dart';
import 'package:digital_portobello/src/pages/product_page.dart';
import 'package:digital_portobello/src/pages/tech_library_page.dart';
import 'package:digital_portobello/src/pages/tech_search_page.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: '/products/:spaceN1Id/:lineId',
    builder: (context, state) => ListProductsPage(
        spaceN1Id: state.params['spaceN1Id'], lineId: state.params['lineId']),
  ),
  GoRoute(
    path: '/products/:lineId',
    builder: (context, state) =>
        ListProductsPage(spaceN1Id: null, lineId: state.params['lineId']),
  ),
  GoRoute(
    path: '/product/:productId',
    builder: (context, state) =>
        ProductPage(productId: state.params['productId']),
  ),
  GoRoute(
    path: '/product/:productId/:spaceN1Id',
    builder: (context, state) => ProductPage(
        productId: state.params['productId'],
        spaceN1Id: state.params['spaceN1Id']),
  ),
  GoRoute(
    path: '/lines/:spaceN1Id',
    builder: (context, state) =>
        ListLinesProductPage(spaceN1Id: state.params['spaceN1Id']),
  ),
  GoRoute(
    path: '/lines/material/:materialName',
    builder: (context, state) =>
        ListLinesProductPage(materialName: state.params['materialName']),
  ),
  GoRoute(
    path: '/spaces/:spaceId',
    builder: (context, state) =>
        ListSpacesPage(spaceId: state.params['spaceId']),
  ),
  GoRoute(
    path: '/tech-search',
    builder: (context, state) => const TechSearchPage(),
  ),
  GoRoute(
    path: '/all-spaces',
    builder: (context, state) => const AllSpacesPage(),
  ),
  GoRoute(
    path: '/favorites',
    builder: (context, state) => const FavoritesPage(),
  ),
  GoRoute(
    path: '/compare',
    builder: (context, state) => const ComparePage(),
  ),
  GoRoute(
    path: '/tech-library',
    builder: (context, state) => const TechLibraryPage(),
  ),
]);
