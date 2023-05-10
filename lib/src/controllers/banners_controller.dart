
import 'dart:convert';

import '../models/banner_model.dart';
import 'package:http/http.dart' as http;

Future<List<BannerModel>> fetchBanners() async {
  final response = await http.get(Uri.parse('http://localhost:8080/banners'));

  if (response.statusCode == 200) {
    Iterable iterable = json.decode(response.body);
    List<BannerModel> banners = List<BannerModel>.from(
            iterable.map((model) => BannerModel.fromJson(model)))
        .where((it) => it.status == 'a' && it.posicao == 'cabeçalho')
        .toList();

    banners.sort((a, b) => a.ordem.compareTo(b.ordem));

    return banners;
  } else {
    throw Exception('Failed to load album');
  }
}
