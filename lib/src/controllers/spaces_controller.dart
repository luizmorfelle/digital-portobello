import 'dart:convert';

import 'package:digital_portobello/src/api/api.dart';
import 'package:digital_portobello/src/models/space_model.dart';
import 'package:digital_portobello/src/models/space_n1_model.dart';
import 'package:digital_portobello/src/models/usage_model.dart';

import '../models/space_home_model.dart';
import '../models/space_n1_home_model.dart';

Future<List<SpaceHomeModel>> fetchSpaces(
    String? usageId, String? surfaceId) async {
  final response = await api.get(url: '/environments_home');
  Iterable iterable = json.decode(response.data);

  List<SpaceHomeModel> spaces = List<SpaceHomeModel>.from(iterable.map((model) {
    return SpaceHomeModel.fromJson(model);
  }))
      .where((it) =>
          it.idSuperficie.toString() == surfaceId &&
          usageId == it.idUso.toString())
      .toList();
  spaces.sort((a, b) => a.title!.compareTo(b.title!));

  return spaces;
}

Future<List<UsageModel>> fetchAllSpacesBySurface(int? surfaceId) async {
  final response = await api.get(url: '/usage');
  List<UsageModel> usages = List<UsageModel>.from(
      json.decode(response.data).map((it) => UsageModel.fromJson(it)));
  for (var usage in usages) {
    await api.get(url: '/environments?usoid=${usage.iD}');
    final response = await api.get(url: '/environments?usoid=${usage.iD}');
    if (response.statusCode == 200) {
      usage.spaces = List<SpaceModel>.from(
          json.decode(response.data).map((it) => SpaceModel.fromJson(it)));
      for (var space in usage.spaces) {
        final response = await api.get(
            url:
                '/environments_n1?ambientes_id=${space?.id}&superficies_id=$surfaceId');
        if (response.statusCode == 200) {
          space?.spacesN1 = List<SpaceN1Model>.from(json
              .decode(response.data)
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
}

Future<SpaceHomeModel> fetchSpaceHome(int? spaceId) async {
  final response = await api.get(url: '/environment_home/$spaceId');
  return SpaceHomeModel.fromJson(jsonDecode(response.data));
}

Future<SpaceModel> fetchSpace(int? spaceId) async {
  final response = await api.get(url: '/environment/$spaceId');
  return SpaceModel.fromJson(jsonDecode(response.data));
}

Future<SpaceN1Model> fetchSpaceN1(int? spaceId) async {
  final response = await api.get(url: '/environment_n1/$spaceId');
  return SpaceN1Model.fromJson(jsonDecode(response.data));
}

Future<SpaceHomeModel> fetchSpaceN1Home(int? spaceId) async {
  final response = await api.get(url: '/environment_n1_home/$spaceId');
  return SpaceHomeModel.fromJson(jsonDecode(response.data));
}

Future<List<SpaceN1HomeModel>> fetchSpacesN1Home(String? spaceId) async {
  final response = await api.get(url: '/environments_n1_home');
  Iterable iterable = json.decode(response.data);
  List<SpaceN1HomeModel> spaces =
      List<SpaceN1HomeModel>.from(iterable.map((model) {
    return SpaceN1HomeModel.fromJson(model);
  })).where((it) => it.idAmbienteHome.toString() == spaceId).toList();

  spaces.sort((a, b) => a.id.compareTo(b.id));
  return spaces;
}
