import 'dart:convert';

import 'package:digital_portobello/src/models/space_model.dart';
import 'package:digital_portobello/src/models/space_n1_model.dart';
import 'package:digital_portobello/src/models/usage_model.dart';
import 'package:http/http.dart' as http;

import '../models/space_home_model.dart';
import '../models/space_n1_home_model.dart';

Future<List<SpaceHomeModel>> fetchSpaces(int? usageId, int? surfaceId) async {
  final response =
      await http.get(Uri.parse('http://localhost:8080/environments_home'));
  if (response.statusCode == 200) {
    Iterable iterable = json.decode(response.body);

    List<SpaceHomeModel> spaces =
        List<SpaceHomeModel>.from(iterable.map((model) {
      return SpaceHomeModel.fromJson(model);
    }))
            .where((it) => it.idSuperficie == surfaceId && usageId == it.idUso)
            .toList();
    spaces.sort((a, b) => a.title!.compareTo(b.title!));

    return spaces;
  } else {
    throw Exception('Failed to load album');
  }
}

Future<List<UsageModel>> fetchAllSpacesBySurface(int? surfaceId) async {
  final response = await http.get(Uri.parse('http://localhost:8080/usage'));
  if (response.statusCode == 200) {
    List<UsageModel> usages = List<UsageModel>.from(
        json.decode(response.body).map((it) => UsageModel.fromJson(it)));
    for (var usage in usages) {
      final response = await http.get(
          Uri.parse('http://localhost:8080/environments?usoid=${usage.iD}'));
      if (response.statusCode == 200) {
        usage.spaces = List<SpaceModel>.from(
            json.decode(response.body).map((it) => SpaceModel.fromJson(it)));
        for (var space in usage.spaces) {
          final response = await http.get(Uri.parse(
              'http://localhost:8080/environments_n1?ambientes_id=${space?.id}&superficies_id=${surfaceId}'));
          if (response.statusCode == 200) {
            space?.spacesN1 = List<SpaceN1Model>.from(json
                .decode(response.body)
                .map((it) => SpaceN1Model.fromJson(it)));
          }
        }
      }
    }
    usages.sort((a, b) => a.title!.compareTo(b.title!));
    for (var usage in usages) {
      usage.spaces.sort((a, b) => a!.title!.compareTo(b!.title!));
      for (var space in usage.spaces) {
        space!.spacesN1.sort((a, b) => a!.title!.compareTo(b!.title!));
      }
    }
    return usages;
  } else {
    throw Exception('Failed to load album');
  }
}

Future<SpaceHomeModel> fetchSpaceHome(int? spaceId) async {
  final response = await http
      .get(Uri.parse('http://localhost:8080/environment_home/$spaceId'));
  if (response.statusCode == 200) {
    return SpaceHomeModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<SpaceModel> fetchSpace(int? spaceId) async {
  final response =
      await http.get(Uri.parse('http://localhost:8080/environment/$spaceId'));
  if (response.statusCode == 200) {
    return SpaceModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<SpaceN1Model> fetchSpaceN1(int? spaceId) async {
  final response = await http
      .get(Uri.parse('http://localhost:8080/environment_n1/$spaceId'));
  if (response.statusCode == 200) {
    return SpaceN1Model.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<SpaceHomeModel> fetchSpaceN1Home(int? spaceId) async {
  final response = await http
      .get(Uri.parse('http://localhost:8080/environment_n1_home/$spaceId'));
  if (response.statusCode == 200) {
    return SpaceHomeModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<List<SpaceN1HomeModel>> fetchSpacesN1Home(String? spaceId) async {
  final response =
      await http.get(Uri.parse('http://localhost:8080/environments_n1_home'));
  if (response.statusCode == 200) {
    Iterable iterable = json.decode(response.body);
    List<SpaceN1HomeModel> spaces =
        List<SpaceN1HomeModel>.from(iterable.map((model) {
      return SpaceN1HomeModel.fromJson(model);
    })).where((it) => it.idAmbienteHome.toString() == spaceId).toList();

    spaces.sort((a, b) => a.id.compareTo(b.id));
    return spaces;
  } else {
    throw Exception('Failed to load album');
  }
}
