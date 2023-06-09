import 'dart:convert';

import 'package:digital_portobello/src/api/api.dart';
import 'package:digital_portobello/src/models/product_line_model.dart';
import 'package:digital_portobello/src/models/product_model.dart';

Future<List<LineProductModel>> fetchProductsLinesByMaterial(
    String? material) async {
  final response = await Api.get(url: '/lines/material/$material');
  if (response.statusCode == 200) {
    Iterable iterable = json.decode(response.data);

    List<LineProductModel> lines =
        List<LineProductModel>.from(iterable.map((model) {
      LineProductModel line = LineProductModel.fromJson(model);
      line.path = 'products/${line.id}';
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

Future<List<ProductModel>> fetchProductsByLineAndSpace(
    String? line, String? space) async {
  final response = await Api.get(url: '/products/line/$line/$space');

  if (response.statusCode == 200) {
    Iterable iterable = json.decode(response.data);

    List<ProductModel> spaces = List<ProductModel>.from(iterable.map((model) {
      ProductModel it = ProductModel.fromJson(model);
      it.path = 'product/${it.id}/$space';
      return it;
    })).toList();

    return spaces;
  } else {
    throw Exception('Failed to load album');
  }
}

Future<List<ProductModel>> fetchProductsByLine(String? line) async {
  final response = await Api.get(url: '/products/line/$line');
  if (response.statusCode == 200) {
    Iterable iterable = json.decode(response.data);

    List<ProductModel> spaces = List<ProductModel>.from(iterable.map((model) {
      return ProductModel.fromJson(model);
    })).toList();

    return spaces;
  } else {
    throw Exception('Failed to load album');
  }
}

Future<ProductModel> fetchProduct(String? idProd) async {
  final response = await Api.get(url: '/product/$idProd');
  if (response.statusCode == 200) {
    return ProductModel.fromJson(jsonDecode(response.data));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<List<ProductModel>> fetchProducts(
    {List<Map<String, String>> filters = const []}) async {
  var body = {"filters": filters};
  final response = await Api.post(url: '/products', body: body);
  if (response.statusCode == 200) {
    Iterable iterable = json.decode(response.data);
    List<ProductModel> spaces = List<ProductModel>.from(iterable.map((model) {
      return ProductModel.fromJson(model);
    })).toList();

    return spaces;
  } else {
    throw Exception('Failed to load album');
  }
}
