import 'package:digital_portobello/src/models/card_item_model.dart';

class SpaceN1Model extends CardItemModel {
  int id;
  int? usoId;
  String? title;
  String? description;
  String? ativo;
  String? image;
  String? homePage;

  SpaceN1Model(
      {required this.id,
      required this.usoId,
      required this.title,
      this.description,
      required this.ativo,
      required this.image,
      required this.homePage})
      : super(id: id, path: 'lines', imagem: image, nome: title!);

  static SpaceN1Model? fromJson(Map<String, dynamic> json) {
    return SpaceN1Model(
        id: json['ID'],
        usoId: json['UsoID'],
        title: json['Title'],
        description: json['Description'],
        ativo: json['Ativo'],
        image: json['Image'],
        homePage: json['HomePage']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['UsoID'] = this.usoId;
    data['Title'] = this.title;
    data['Description'] = this.description;
    data['Ativo'] = this.ativo;
    data['Image'] = this.image;
    data['HomePage'] = this.homePage;
    return data;
  }
}
