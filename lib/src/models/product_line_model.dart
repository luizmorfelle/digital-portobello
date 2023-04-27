import 'package:digital_portobello/src/models/card_item_model.dart';

class LineProductModel extends CardItemModel {
  LineProductModel({
    required int id,
    String path = 'products',
    required String imagem,
    required String nome,
    String? description,
  }) : super(
            id: id,
            path: path,
            imagem: imagem,
            nome: nome,
            description: description);
}
