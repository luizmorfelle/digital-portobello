import 'dart:convert';

import 'package:digital_portobello/src/api/api.dart';
import 'package:digital_portobello/src/models/field_tech_search.dart';
import 'package:digital_portobello/src/models/group_product_model.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../providers/sales_channel_provider.dart';

Future<List<GroupProductModel>> fetchProductsGroupsBySpace(
    int? spaceN1Id, BuildContext context) async {
  final response = await api.get(url: '/groups/$spaceN1Id', queryParameters: {
    'cv': Provider.of<SalesChannelProvider>(context).getSaleChannel.id
  });

  if (response.statusCode == 200) {
    Iterable iterable = json.decode(response.data);

    List<GroupProductModel> lines =
        List<GroupProductModel>.from(iterable.map((model) {
      GroupProductModel line = GroupProductModel.fromJson(model);
      line.spaceN1Id = spaceN1Id;
      line.path = 'products/groups/$spaceN1Id/${line.id}';
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

Future<List<GroupProductModel>> fetchProductsGroupsByFilter(
    List<FieldTechSearch> fields, BuildContext context) async {
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
        .toSet()
        .join(',');

    return dataItem;
  }).toList();

  final response = await api.post(url: '/groups', body: body, queryParameters: {
    'cv': Provider.of<SalesChannelProvider>(context).getSaleChannel.id
  });

  if (response.statusCode == 200 && response.data != 'null') {
    Iterable iterable = json.decode(response.data);

    List<GroupProductModel> lines =
        List<GroupProductModel>.from(iterable.map((model) {
      GroupProductModel line = GroupProductModel.fromJson(model);

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

Future<List<GroupProductModel>> fetchProductsGroupsByMaterial(
    String? material, BuildContext context) async {
  print("aaaaaaaa");
  final response = await api.get(
      url: '/groups/material/$material',
      queryParameters: {
        'cv': Provider.of<SalesChannelProvider>(context).getSaleChannel.id
      });
  if (response.statusCode == 200) {
    Iterable iterable = json.decode(response.data);

    List<GroupProductModel> lines =
        List<GroupProductModel>.from(iterable.map((model) {
      GroupProductModel line = GroupProductModel.fromJson(model);
      line.path = 'products/groups/${line.id}';
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
