import 'package:digital_portobello/src/models/dropdown_model.dart';

class CardItemModel extends DropDownModel {
  String? path;
  String? imagem;
  String? nome;
  String? tooltip;
  String simulador = "N";
  bool isFull = true;

  CardItemModel({
    required int id,
    required this.path,
    required this.imagem,
    required this.nome,
    this.isFull = true,
    this.simulador = "N",
    this.tooltip,
    super.description,
  }) : super(id.toString(), nome!);
}
