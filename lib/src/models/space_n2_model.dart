import 'package:digital_portobello/src/models/card_item_model.dart';

class SpaceN2Model extends CardItemModel {
  SpaceN2Model({
    required int id,
    String path = 'lines',
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
