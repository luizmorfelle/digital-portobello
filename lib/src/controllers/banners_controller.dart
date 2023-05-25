import 'dart:convert';

import 'package:digital_portobello/src/models/banner_surface_model.dart';
import 'package:http/http.dart' as http;

import '../models/banner_home_model.dart';

Future<List<BannerHomeModel>> fetchBanners() async {
  final response = await http.get(Uri.parse('http://localhost:8080/banners'));

  if (response.statusCode == 200) {
    Iterable iterable = json.decode(response.body);
    List<BannerHomeModel> banners = List<BannerHomeModel>.from(
            iterable.map((model) => BannerHomeModel.fromJson(model)))
        .where((it) => it.status == 'a' && it.posicao == 'cabeçalho')
        .toList();

    banners.sort((a, b) => a.ordem.compareTo(b.ordem));

    return banners;
  } else {
    throw Exception('Failed to load album');
  }
}

Future<List<BannerSurfaceModel>> fetchBannersSurface(
    {String? spaceN1Id,
    String? tags,
    String? products,
    String? material,
    String? line,
    String? spaceId}) async {
  final queryParameters = {
    'tags': tags ?? "",
    'products': products ?? "",
    'material': material ?? "",
    'ambient_n1_id': spaceN1Id ?? "",
    'ambient_id': spaceId ?? "",
  };
  final response = await http
      .get(Uri.http('localhost:8080', '/banner_surface', queryParameters));

  if (response.statusCode == 200) {
    Iterable iterable = json.decode(response.body);
    List<BannerSurfaceModel> banners = List<BannerSurfaceModel>.from(
        iterable.map((model) => BannerSurfaceModel.fromJson(model))).toList();
    return banners;
  } else {
    throw Exception('Failed to load album');
  }
}
