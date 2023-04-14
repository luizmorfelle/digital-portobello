import 'package:digital_portobello/src/pages/all_spaces_page.dart';
import 'package:digital_portobello/src/pages/home_page.dart';
import 'package:digital_portobello/src/pages/spaces_list_page.dart';
import 'package:digital_portobello/src/pages/tech_search_page.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: '/spaces',
    builder: (context, state) => const SpacesListPage(),
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
    builder: (context, state) => const AllSpacesPage(),
  ),
]);
