import 'package:digital_portobello/src/models/space_model.dart';

class UsageModel {
  int? iD;
  String? title;
  String? description;
  String? ativo;
  String? image;
  List<SpaceModel?> spaces = [];

  UsageModel({this.iD, this.title, this.description, this.ativo, this.image});

  UsageModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    title = json['Title'];
    description = json['Description'];
    ativo = json['Ativo'];
    image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['Title'] = title;
    data['Description'] = description;
    data['Ativo'] = ativo;
    data['Image'] = image;
    return data;
  }
}
