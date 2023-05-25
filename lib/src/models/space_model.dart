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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['UsoID'] = this.usoId;
    data['Title'] = this.title;
    data['Description'] = this.description;
    data['Ativo'] = this.ativo;
    data['Image'] = this.image;
    return data;
  }
}
