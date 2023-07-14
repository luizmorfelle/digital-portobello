import 'package:digital_portobello/src/models/card_item_model.dart';

class GroupProductModel extends CardItemModel {
  int? spaceN1Id;
  List<String>? colors = [];
  List<String>? materials = [];

  GroupProductModel(
      {required int id,
      required String imagem,
      required String nome,
      String? description,
      this.colors,
      this.materials,
      super.simulador,
      int? spaceN1Id})
      : super(
            id: id,
            isFull: false,
            path: spaceN1Id == null
                ? 'products/groups/$id'
                : 'products/groups/$spaceN1Id/$id',
            imagem: 'assets/images/products/$imagem',
            nome: nome,
            description: description);

  factory GroupProductModel.fromJson(Map<String, dynamic> json) {
    var it = GroupProductModel(
      id: int.parse(json['Cod_grupo']),
      imagem: json['ZoomImage'].toString().split(',')[0],
      nome: json['Grupo'],
      description: json['Descricao'],
      simulador: json['Simulador'],
      colors: json['Cor'].toString().split(','),
      materials: json['Material'].toString().split(','),
    );

    return it;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['Cod_grupo'] = id;
    data['ZoomImage'] = imagem;
    data['Grupo'] = nome;
    data['Descricao'] = description;
    data['Cor'] = colors;
    data['Material'] = materials;
    data['Simulador'] = simulador;

    return data;
  }
}
