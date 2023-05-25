import 'package:digital_portobello/src/models/item_field_tech_search.dart';

class FieldTechSearch {
  int id;
  String title;
  String? description;
  String? fieldApi;
  String? operatorApi;
  List<ItemFieldTechSearch> itens;

  FieldTechSearch(
      {required this.id,
      required this.title,
      required this.itens,
      this.fieldApi,
      this.operatorApi});
}
