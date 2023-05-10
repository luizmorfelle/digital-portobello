import 'dart:convert';

import 'package:digital_portobello/src/models/space_model.dart';
import 'package:http/http.dart' as http;

import '../models/space_n1_model.dart';

Future<List<SpaceModel>> fetchSpaces(int usoId, int spaceId) async {
  final response =
      await http.get(Uri.parse('http://localhost:8080/environments'));
  if (response.statusCode == 200) {
    Iterable iterable = json.decode(response.body);

    List<SpaceModel> spaces = List<SpaceModel>.from(iterable.map((model) {
      return SpaceModel.fromJson(model);
    })).where((it) => it.usoId == usoId).toList();
    spaces.sort((a, b) => a.id.compareTo(b.id));

    return spaces;
  } else {
    throw Exception('Failed to load album');
  }
}

Future<List<SpaceN1Model>> fetchSpacesN1(int spaceId, int surfaceId) async {
  final response =
      await http.get(Uri.parse('http://localhost:8080/environments_n1'));
  if (response.statusCode == 200) {
    Iterable iterable = json.decode(response.body);

    List<SpaceN1Model> spaces = List<SpaceN1Model>.from(iterable.map((model) {
      return SpaceN1Model.fromJson(model);
    })).toList();
    spaces.sort((a, b) => a.id.compareTo(b.id));

    return spaces;
  } else {
    throw Exception('Failed to load album');
  }
}
