import 'package:digital_portobello/src/models/card_item_model.dart';

class MaterialModel extends CardItemModel {
  MaterialModel(
      {required int id,
      String path = 'material',
      required String imagem,
      required String nome})
      : super(id: id, path: path, imagem: imagem, nome: nome);
}
