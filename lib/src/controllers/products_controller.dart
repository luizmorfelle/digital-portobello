import 'dart:convert';
import 'dart:io';

import 'package:digital_portobello/src/models/product_line_model.dart';
import 'package:digital_portobello/src/models/product_model.dart';
import 'package:http/http.dart' as http;

Future<List<LineProductModel>> fetchProductsLinesByMaterial(
    String? material) async {
  final response = await http
      .get(Uri.parse('http://localhost:8080/lines/material/$material'));
  if (response.statusCode == 200) {
    Iterable iterable = json.decode(response.body);

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
  final response = await http
      .get(Uri.parse('http://localhost:8080/products/line/$line/$space'));
  if (response.statusCode == 200) {
    Iterable iterable = json.decode(response.body);

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
  final response =
      await http.get(Uri.parse('http://localhost:8080/products/line/$line'));
  if (response.statusCode == 200) {
    Iterable iterable = json.decode(response.body);

    List<ProductModel> spaces = List<ProductModel>.from(iterable.map((model) {
      return ProductModel.fromJson(model);
    })).toList();

    return spaces;
  } else {
    throw Exception('Failed to load album');
  }
}

Future<ProductModel> fetchProduct(String? idProd) async {
  final response =
      await http.get(Uri.parse('http://localhost:8080/product/$idProd'));
  if (response.statusCode == 200) {
    return ProductModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<List<ProductModel>> fetchFavoriteProducts() async {
  final response =
      await http.get(Uri.parse('http://localhost:8080/products/516/166'));
  if (response.statusCode == 200) {
    Iterable iterable = json.decode(response.body);

    List<ProductModel> spaces = List<ProductModel>.from(iterable.map((model) {
      return ProductModel.fromJson(model);
    })).toList();

    return spaces;
  } else {
    throw Exception('Failed to load album');
  }
}
