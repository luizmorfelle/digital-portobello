import 'package:digital_portobello/src/models/card_item_model.dart';
import 'package:digital_portobello/src/models/space_home_model.dart';

class SpaceN1HomeModel extends CardItemModel {
  String? title;
  String? image;
  int? idAmbienteHome;
  int? idAmbienteN1;
  SpaceHomeModel? spaceHome;

  SpaceN1HomeModel(
      {required super.id,
      required this.title,
      required this.image,
      this.idAmbienteHome,
      this.spaceHome,
      this.idAmbienteN1})
      : super(
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = id;
    data['Title'] = title;
    data['Image'] = image;
    data['AmbienteHomeId'] = idAmbienteHome;
    data['AmbienteN1Id'] = idAmbienteN1;
    return data;
  }
}
