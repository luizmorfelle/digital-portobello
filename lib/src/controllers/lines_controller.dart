import 'dart:convert';

import 'package:digital_portobello/src/models/field_tech_search.dart';

import '../models/product_line_model.dart';
import 'package:http/http.dart' as http;

Future<List<LineProductModel>> fetchProductsLinesBySpace(int? spaceN1Id) async {
  final response =
      await http.get(Uri.parse('http://localhost:8080/lines/$spaceN1Id'));
  if (response.statusCode == 200) {
    Iterable iterable = json.decode(response.body);

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
    dataItem["value"] = field.itens
        .where((it) => it.checked)
        .map((item) => "'${item.value}'")
        .join(',');
    return dataItem;
  }).toList();

  final response = await http.post(Uri.parse('http://localhost:8080/lines'),
      body: json.encode(body));
  if (response.statusCode == 200 && response.body != 'null') {
    Iterable iterable = json.decode(response.body);

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
