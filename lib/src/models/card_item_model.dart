import 'package:digital_portobello/src/models/dropdown_model.dart';

class CardItemModel extends DropDownModel {
  String? path;
  String? imagem;
  String? nome;
  String? description;

  CardItemModel({
    required int id,
    required this.path,
    required this.imagem,
    required this.nome,
    this.description,
  }) : super(id, nome!);
}
