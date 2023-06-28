import 'package:digital_portobello/src/models/file_model.dart';

class TechLibraryTab {
  final int id;
  final String title;
  List<FileModel>? files;

  TechLibraryTab(this.id, this.title, {this.files});

  factory TechLibraryTab.fromJson(Map<String, dynamic> json) {
    return TechLibraryTab(json['ID'], json['Title']);
  }

  toJson() {
    return {
      'ID': id,
      'Title': title,
    };
  }
}
