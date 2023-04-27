import 'package:digital_portobello/src/models/card_item_model.dart';

class GridItemModel extends CardItemModel {
  GridItemModel(
      {required super.id,
      required super.path,
      required super.imagem,
      required super.nome,
      super.description});
}
