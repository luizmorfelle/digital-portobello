import 'package:digital_portobello/src/models/field_tech_search.dart';

Map<String, dynamic> getFilterTechSearch(List<FieldTechSearch>? fields) {
  Map<String, dynamic> body = <String, dynamic>{};

  if (fields == null) return body;

  body['filters'] = fields
      .where((field) => field.itens.any((item) => item.checked))
      .map((field) {
    Map<String, dynamic> dataItem = <String, dynamic>{};
    if (field.operatorApi == "in") {
      dataItem["field"] = field.fieldApi;
      dataItem["operator"] = field.operatorApi;
      dataItem["value"] = field.itens
          .where((it) => it.checked)
          .map((item) => "'${item.value}'")
          .toSet()
          .join(',');
    } else {
      dataItem["field"] = '(${field.fieldApi}';
      dataItem["operator"] = field.operatorApi;
      dataItem["value"] = field.itens
          .where((it) => it.checked)
          .map((item) => "'${item.value}'")
          .toSet()
          .join(' and uso like ');
      dataItem["value"] = dataItem["value"] + ')';
    }
    return dataItem;
  }).toList();
  return body;
}
