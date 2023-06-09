import 'package:digital_portobello/src/models/card_item_model.dart';

class LineProductModel extends CardItemModel {
  int? spaceN1Id;
  List<String>? colors = [];
  List<String>? materials = [];

  LineProductModel(
      {required int id,
      required String imagem,
      required String nome,
      String? description,
      this.colors,
      this.materials,
      int? spaceN1Id})
      : super(
            id: id,
            path:
                spaceN1Id == null ? 'products/$id' : 'products/$spaceN1Id/$id',
            imagem: 'assets/images$imagem',
            nome: nome,
            description: description);

  factory LineProductModel.fromJson(Map<String, dynamic> json) {
    var it = LineProductModel(
      id: int.parse(json['Cod_linha']),
      imagem: json['ZoomImage'].toString().split(',')[0],
      nome: json['Linha'],
      colors: json['Cor'].toString().split(','),
      materials: json['Material'].toString().split(','),
    );

    return it;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Linha'] = nome;
    data['Cod_linha'] = id;
    data['ZoomImage'] = imagem;
    return data;
  }
}
