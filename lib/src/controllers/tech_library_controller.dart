import 'dart:convert';

import 'package:digital_portobello/src/api/api.dart';
import 'package:digital_portobello/src/models/tech_library_tab.dart';

Future<List<TechLibraryTab>> fetchTechLibraryTabs() async {
  final response = await Api.get(url: '/abas_biblioteca');

  if (response.statusCode == 200) {
    return List<TechLibraryTab>.from(json
        .decode(response.data)
        .map((model) => TechLibraryTab.fromJson(model))).toList();
  } else {
    throw Exception('Failed to load album');
  }
}
