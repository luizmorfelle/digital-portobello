import 'dart:convert';

import 'package:digital_portobello/src/api/api.dart';
import 'package:digital_portobello/src/models/field_tech_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_line_model.dart';
import '../providers/sales_channel_provider.dart';
import '../utils/filter_tech_search_utils.dart';

Future<List<LineProductModel>> fetchProductsLinesBySpace(
    int? spaceN1Id, BuildContext context) async {
  final response = await api.get(url: '/lines/$spaceN1Id', queryParameters: {
    'cv': Provider.of<SalesChannelProvider>(context).getSaleChannel.id
  });

  if (response.statusCode == 200) {
    Iterable iterable = json.decode(response.data);

    List<LineProductModel> lines =
        List<LineProductModel>.from(iterable.map((model) {
      LineProductModel line = LineProductModel.fromJson(model);
      line.spaceN1Id = spaceN1Id;
      line.path = 'products/line/$spaceN1Id/${line.id}';
      return line;
    })).toList();
    lines.sort(
      (a, b) => a.nome!.compareTo(b.nome!),
    );
    return lines;
  } else {
    throw Exception('Failed to load album');
  }
}

Future<List<LineProductModel>> fetchProductsLinesByFilter(
    List<FieldTechSearch> fields, BuildContext context) async {
  final response = await api.post(
      url: '/lines',
      body: getFilterTechSearch(fields),
      queryParameters: {
        'cv': Provider.of<SalesChannelProvider>(context).getSaleChannel.id
      });

  if (response.statusCode == 200 && response.data != 'null') {
    Iterable iterable = json.decode(response.data);

    List<LineProductModel> lines =
        List<LineProductModel>.from(iterable.map((model) {
      LineProductModel line = LineProductModel.fromJson(model);

      return line;
    })).toList();
    lines.sort(
      (a, b) => a.nome!.compareTo(b.nome!),
    );
    return lines;
  } else {
    throw Exception('Failed to load album');
  }
}

Future<List<LineProductModel>> fetchProductsLinesByMaterial(
    String? material, BuildContext context) async {
  final response = await api.get(
      url: '/lines/material/$material',
      queryParameters: {
        'cv': Provider.of<SalesChannelProvider>(context).getSaleChannel.id
      });
  if (response.statusCode == 200) {
    Iterable iterable = json.decode(response.data);

    List<LineProductModel> lines =
        List<LineProductModel>.from(iterable.map((model) {
      LineProductModel line = LineProductModel.fromJson(model);
      line.path = 'products/line/${line.id}';
      return line;
    })).toList();
    lines.sort(
      (a, b) => a.nome!.compareTo(b.nome!),
    );
    return lines;
  } else {
    throw Exception('Failed to load album');
  }
}
