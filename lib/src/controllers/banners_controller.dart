import 'dart:convert';

import 'package:digital_portobello/main.dart';
import 'package:digital_portobello/src/api/api.dart';
import 'package:digital_portobello/src/models/banner_surface_model.dart';

import '../models/banner_home_model.dart';

Future<List<BannerHomeModel>> fetchBanners() async {
  final response = await api.get(url: '/banners');

  Iterable iterable = json.decode(response.data);
  List<BannerHomeModel> banners = List<BannerHomeModel>.from(
          iterable.map((model) => BannerHomeModel.fromJson(model)))
      .where((it) =>
          it.status == 'a' &&
          it.posicao == 'cabeçalho' &&
          (it.aplicacao == 'T' ||
              (it.aplicacao == 'L' &&
                  it.idsAplicacao!.split(' ').contains(id))))
      .toList();

  banners.sort((a, b) => a.ordem.compareTo(b.ordem));

  return banners;
}

Future<List<BannerSurfaceModel>> fetchBannersSurface({
  String? spaceN1Id,
  String? tags,
  String? products,
  String? material,
  String? line,
  String? spaceId,
}) async {
  final queryParameters = {
    'tags': tags ?? "",
    'products': products ?? "",
    'material': material ?? "",
    'ambient_n1_id': spaceN1Id ?? "",
    'ambient_id': spaceId ?? "",
  };
  final response =
      await api.get(url: '/banner_surface', queryParameters: queryParameters);

  Iterable iterable = json.decode(response.data);
  List<BannerSurfaceModel> banners = List<BannerSurfaceModel>.from(
          iterable.map((model) => BannerSurfaceModel.fromJson(model)))
      .take(20)
      .toList();
  return banners;
}
