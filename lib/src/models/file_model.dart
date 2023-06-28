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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['AbaID'] = this.abaId;
    data['Title'] = this.title;
    data['Description'] = this.description;
    data['Url'] = this.url;
    data['Tipo'] = this.tipo;
    return data;
  }
}
