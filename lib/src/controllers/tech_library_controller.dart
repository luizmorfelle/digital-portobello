import 'dart:convert';

import 'package:digital_portobello/src/api/api.dart';
import 'package:digital_portobello/src/models/file_model.dart';
import 'package:digital_portobello/src/models/tech_library_tab.dart';

Future<List<TechLibraryTab>> fetchTechLibraryTabs() async {
  final response = await api.get(url: '/abas_biblioteca');

  if (response.statusCode == 200) {
    final list = List<TechLibraryTab>.from(json
        .decode(response.data)
        .map((model) => TechLibraryTab.fromJson(model))).toList();

    for (var element in list) {
      final response = await api.get(url: '/arquivos/${element.id}');
      if (response.statusCode == 200) {
        element.files = List<FileModel>.from(json
            .decode(response.data)
            .map((model) => FileModel.fromJson(model))).toList();
      }
    }
    return list;
  } else {
    throw Exception('Failed to load album');
  }
}
