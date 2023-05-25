import 'dart:convert';

import 'package:digital_portobello/src/models/material_model.dart';
import 'package:http/http.dart' as http;

Future<List<MaterialModel>> fetchMaterials() async {
  final response = await http.get(Uri.parse('http://localhost:8080/materials'));

  if (response.statusCode == 200) {
    Iterable iterable = json.decode(response.body);
    List<MaterialModel> materials = List<MaterialModel>.from(
        iterable.map((model) => MaterialModel.fromJson(model))).toList();

    materials.sort((a, b) => a.nome!.compareTo(b.nome!));

    return materials;
  } else {
    throw Exception('Failed to load album');
  }
}
