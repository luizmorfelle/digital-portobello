import 'package:digital_portobello/src/models/card_item_model.dart';

class SpaceModel extends CardItemModel {
  SpaceModel(
      {required int id,
      String path = 'space',
      required String imagem,
      required String nome})
      : super(id: id, path: path, imagem: imagem, nome: nome);
}
