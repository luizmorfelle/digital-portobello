import 'package:digital_portobello/src/models/card_item_model.dart';

class SpaceN1HomeModel extends CardItemModel {
  int id;
  String? title;
  String? image;
  int? idAmbienteHome;
  int? idAmbienteN1;

  SpaceN1HomeModel(
      {required this.id,
      required this.title,
      required this.image,
      this.idAmbienteHome,
      this.idAmbienteN1})
      : super(
            id: id,
            path: 'lines/$idAmbienteN1',
            imagem: "assets/images/spacesN1/$image",
            nome: title!);

  factory SpaceN1HomeModel.fromJson(Map<String, dynamic> json) {
    return SpaceN1HomeModel(
        id: json['ID'],
        title: json['Title'],
        image: json['Image'],
        idAmbienteHome: json['AmbienteHomeId'],
        idAmbienteN1: json['AmbienteN1Id']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['Title'] = this.title;
    data['Image'] = this.image;
    data['AmbienteHomeId'] = this.idAmbienteHome;
    data['AmbienteN1Id'] = this.idAmbienteN1;
    return data;
  }
}
