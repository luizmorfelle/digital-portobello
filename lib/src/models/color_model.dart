import 'package:digital_portobello/src/models/card_item_model.dart';

class ColorModel extends CardItemModel {
  ColorModel({
    required int id,
    String path = 'lines',
    String? imagem,
    required String nome,
    String? description,
  }) : super(
            id: id,
            path: path,
            imagem: imagem,
            nome: nome,
            description: description);
}
