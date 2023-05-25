import 'package:digital_portobello/src/models/card_item_model.dart';

class MaterialModel extends CardItemModel {
  String? slug;
  MaterialModel({
    required super.id,
    imagem,
    required String nome,
    this.slug,
    String? description,
  }) : super(
            path: 'lines/material/$slug',
            imagem: 'assets/images/materials/$imagem',
            nome: nome,
            description: description);

  factory MaterialModel.fromJson(Map<String, dynamic> json) {
    return MaterialModel(
        id: json['ID'],
        nome: json['Nome'],
        slug: json['Slug'],
        imagem: json['Imagem']);
  }
}
