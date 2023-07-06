import 'package:digital_portobello/src/models/item_field_tech_search.dart';
import 'package:tuple/tuple.dart';

class FieldTechSearch {
  int id;
  String title;
  String type;
  String? description;
  String? fieldApi;
  String? operatorApi;
  int? indexField;
  Tuple2<int, int>? indexValuesApi;
  List<ItemFieldTechSearch> itens;

  FieldTechSearch(
      {required this.id,
      required this.title,
      required this.itens,
      this.type = "checkbox",
      this.fieldApi,
      this.operatorApi,
      this.indexField,
      this.indexValuesApi});
}
