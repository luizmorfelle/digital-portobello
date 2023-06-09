import 'package:digital_portobello/src/models/space_n1_model.dart';

class SpaceModel {
  int? id;
  int? usoId;
  String? title;
  String? description;
  String? ativo;
  String? image;
  List<SpaceN1Model?> spacesN1 = [];

  SpaceModel({
    required this.id,
    required this.usoId,
    required this.title,
    required this.description,
    required this.ativo,
    required this.image,
  });

  factory SpaceModel.fromJson(Map<String, dynamic> json) {
    return SpaceModel(
        id: json['ID'],
        usoId: json['UsoID'],
        title: json['Title'],
        description: json['Description'],
        ativo: json['Ativo'],
        image: json['Image']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = id;
    data['UsoID'] = usoId;
    data['Title'] = title;
    data['Description'] = description;
    data['Ativo'] = ativo;
    data['Image'] = image;
    return data;
  }
}
