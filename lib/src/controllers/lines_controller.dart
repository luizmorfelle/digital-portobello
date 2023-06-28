import 'dart:convert';
import 'dart:math';

import 'package:digital_portobello/src/api/api.dart';
import 'package:digital_portobello/src/models/field_tech_search.dart';

import '../models/product_line_model.dart';
import '../providers/sales_channel_provider.dart';

Future<List<LineProductModel>> fetchProductsLinesBySpace(int? spaceN1Id) async {
  final response = await api.get(
      url: '/lines/$spaceN1Id',
      queryParameters: {'cv': SalesChannelProvider().getSaleChannel.id});

  if (response.statusCode == 200) {
    Iterable iterable = json.decode(response.data);

    List<LineProductModel> lines =
        List<LineProductModel>.from(iterable.map((model) {
      LineProductModel line = LineProductModel.fromJson(model);
      line.spaceN1Id = spaceN1Id;
      line.path = 'products/$spaceN1Id/${line.id}';
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
    List<FieldTechSearch> fields) async {
  Map<String, dynamic> body = <String, dynamic>{};
  body['filters'] = fields
      .where((field) => field.itens.any((item) => item.checked))
      .map((field) {
    Map<String, dynamic> dataItem = <String, dynamic>{};
    dataItem["field"] = field.fieldApi;
    dataItem["operator"] = field.operatorApi;
    var values = field.itens
        .where((it) => it.checked)
        .map((item) => "'${item.value}'")
        .join(',');
    if (field.operatorApi == 'in') {
      dataItem["value"] = values;
    } else if (field.operatorApi == '<=') {
      dataItem["value"] =
          values.split(',').map((e) => double.parse(e.trim())).reduce(max);
    } else if (field.operatorApi == 'between') {
      // dataItem["value"] = values.split(',').
    } else {
      dataItem["value"] =
          values.split(',').map((e) => double.parse(e)).reduce(min);
    }
    return dataItem;
  }).toList();

  final response = await api.post(
      url: '/lines',
      body: body,
      queryParameters: {'cv': SalesChannelProvider().getSaleChannel.id});

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
