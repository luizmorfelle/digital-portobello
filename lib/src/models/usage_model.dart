class UsageModel {
  int id;
  String title;
  String description;
  String ativo;
  String image;

  UsageModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.ativo,
      required this.image});

  UsageModel fromJson(Map<String, dynamic> json) {
    return UsageModel(
        id: json['ID'],
        title: json['Title'],
        description: json['Description'],
        ativo: json['Ativo'],
        image: json['Image']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['Title'] = this.title;
    data['Description'] = this.description;
    data['Ativo'] = this.ativo;
    data['Image'] = this.image;
    return data;
  }
}
