import 'package:digital_portobello/src/models/card_item_model.dart';

class SpaceHomeModel extends CardItemModel {
  String? title;
  String? image;
  int? idAmbiente;
  int? idUso;
  int? idSuperficie;

  SpaceHomeModel(
      {required super.id,
      required this.title,
      required this.image,
      this.idAmbiente,
      this.idUso,
      this.idSuperficie})
      : super(
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = id;
    data['UsoID'] = idUso;
    data['AmbienteId'] = idAmbiente;
    data['SuperficieId'] = idSuperficie;
    data['Title'] = title;
    data['Image'] = image;
    return data;
  }
}
