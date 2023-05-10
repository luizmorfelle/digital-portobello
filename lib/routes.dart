import 'package:digital_portobello/src/pages/all_spaces_page.dart';
import 'package:digital_portobello/src/pages/favorites_page.dart';
import 'package:digital_portobello/src/pages/home_page.dart';
import 'package:digital_portobello/src/pages/list_lines_product_page.dart';
import 'package:digital_portobello/src/pages/list_products_page.dart';
import 'package:digital_portobello/src/pages/list_spaces_page.dart';
import 'package:digital_portobello/src/pages/product_page.dart';
import 'package:digital_portobello/src/pages/tech_search_page.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: '/products',
    builder: (context, state) => const ListProductsPage(),
  ),
  GoRoute(
    path: '/product',
    builder: (context, state) => const ProductPage(),
  ),
  GoRoute(
    path: '/lines',
    builder: (context, state) => const ListLinesProductPage(),
  ),
  GoRoute(
    path: '/spaces',
    builder: (context, state) => const ListSpacesPage(),
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
]);
