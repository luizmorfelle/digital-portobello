import 'package:digital_portobello/src/models/card_item_model.dart';

class SpaceModel extends CardItemModel {
  SpaceModel({
    required int id,
    String path = 'spaces',
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
