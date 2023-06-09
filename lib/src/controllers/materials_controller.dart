import 'dart:convert';

import 'package:digital_portobello/src/api/api.dart';
import 'package:digital_portobello/src/models/material_model.dart';

Future<List<MaterialModel>> fetchMaterials() async {
  final response = await Api.get(url: '/materials');

  if (response.statusCode == 200) {
    Iterable iterable = json.decode(response.data);
    List<MaterialModel> materials = List<MaterialModel>.from(
        iterable.map((model) => MaterialModel.fromJson(model))).toList();

    materials.sort((a, b) => a.nome!.compareTo(b.nome!));

    return materials;
  } else {
    throw Exception('Failed to load album');
  }
}
