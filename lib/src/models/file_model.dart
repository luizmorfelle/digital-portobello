class FileModel {
  int? id;
  int? abaId;
  String? title;
  String? description;
  String? url;
  String? tipo;

  FileModel(
      {required this.id,
      required this.abaId,
      this.title,
      this.description,
      this.url,
      this.tipo});

  FileModel.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    abaId = json['AbaID'];
    title = json['Title'];
    description = json['Description'];
    url = json['Url'];
    tipo = json['Tipo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = id;
    data['AbaID'] = abaId;
    data['Title'] = title;
    data['Description'] = description;
    data['Url'] = url;
    data['Tipo'] = tipo;
    return data;
  }
}
