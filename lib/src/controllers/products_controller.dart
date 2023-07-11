import 'dart:convert';

import 'package:digital_portobello/src/api/api.dart';
import 'package:digital_portobello/src/models/field_tech_search.dart';
import 'package:digital_portobello/src/models/product_line_model.dart';
import 'package:digital_portobello/src/models/product_model.dart';
import 'package:digital_portobello/src/providers/sales_channel_provider.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../utils/filter_tech_search_utils.dart';

Future<List<ProductModel>> fetchProductsByLineAndSpace(
    String? line, String? space, BuildContext context) async {
  final response = await api.get(
      url: '/products/line/$line/$space',
      queryParameters: {
        'cv': Provider.of<SalesChannelProvider>(context).getSaleChannel.id
      });

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

Future<List<ProductModel>> fetchProductsByLine(
    String? line, BuildContext context) async {
  final response = await api.get(url: '/products/line/$line', queryParameters: {
    'cv': Provider.of<SalesChannelProvider>(context).getSaleChannel.id
  });
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
  final response = await api.get(url: '/product/$idProd');
  return ProductModel.fromJson(jsonDecode(response.data));
}

Future<List<ProductModel>> fetchProducts(
    {List<Map<String, String>>? filters}) async {
  filters ??= [];
  if (SalesChannelProvider().getSaleChannel.description != null) {
    filters.add({
      "field": SalesChannelProvider().getSaleChannel.description!,
      "value": "Y",
      "operator": "="
    });
  }
  var body = {"filters": filters};
  final response = await api.post(url: '/products', body: body);
  Iterable iterable = json.decode(response.data);
  List<ProductModel> spaces = List<ProductModel>.from(iterable.map((model) {
    return ProductModel.fromJson(model);
  })).toList();

  return spaces;
}

Future<List<ProductModel>> fetchProductsByGroupAndSpace(
    String? line, String? space, BuildContext context) async {
  print('line: $line, space: $space');
  final response = await api.get(
      url: '/products/groups/$line/$space',
      queryParameters: {
        'cv': Provider.of<SalesChannelProvider>(context).getSaleChannel.id
      });

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

Future<List<ProductModel>> fetchProductsByGroup(
    String? group, BuildContext context) async {
  final response = await api.get(
      url: '/products/groups/$group',
      queryParameters: {
        'cv': Provider.of<SalesChannelProvider>(context).getSaleChannel.id
      });
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

Future<List<ProductModel>> fetchProductsByGroupAndSpaceFilters(String? line,
    String? space, List<FieldTechSearch>? fields, BuildContext context) async {
  final response = await api.post(
      url: '/products/groups/$line/$space',
      body: getFilterTechSearch(fields),
      queryParameters: {
        'cv': Provider.of<SalesChannelProvider>(context).getSaleChannel.id
      });

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

Future<List<ProductModel>> fetchProductsByGroupFilters(
    String? group, List<FieldTechSearch>? fields, BuildContext context) async {
  final response = await api.post(
      url: '/products/groups/$group',
      body: getFilterTechSearch(fields),
      queryParameters: {
        'cv': Provider.of<SalesChannelProvider>(context).getSaleChannel.id
      });
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
