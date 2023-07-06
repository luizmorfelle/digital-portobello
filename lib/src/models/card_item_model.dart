import 'package:digital_portobello/src/models/dropdown_model.dart';

class CardItemModel extends DropDownModel {
  String? path;
  String? imagem;
  String? nome;
  String? description;
  bool isFull = true;

  CardItemModel({
    required int id,
    required this.path,
    required this.imagem,
    required this.nome,
    this.isFull = true,
    this.description,
  }) : super(id.toString(), nome!);
}
