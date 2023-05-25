import 'package:digital_portobello/src/models/card_item_model.dart';

class SpaceHomeModel extends CardItemModel {
  int id;
  String? title;
  String? image;
  int? idAmbiente;
  int? idUso;
  int? idSuperficie;

  SpaceHomeModel(
      {required this.id,
      required this.title,
      required this.image,
      this.idAmbiente,
      this.idUso,
      this.idSuperficie})
      : super(
            id: id,
            path: 'spaces/$id',
            imagem: "assets/images/spaces/$image",
            nome: title!);

  factory SpaceHomeModel.fromJson(Map<String, dynamic> json) {
    return SpaceHomeModel(
        id: json['ID'],
        idAmbiente: json['AmbienteId'],
        idSuperficie: json['SuperficieId'],
        idUso: json['UsoID'],
        title: json['Title'],
        image: json['Image']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['UsoID'] = this.idUso;
    data['AmbienteId'] = this.idAmbiente;
    data['SuperficieId'] = this.idSuperficie;
    data['Title'] = this.title;
    data['Image'] = this.image;
    return data;
  }
}
