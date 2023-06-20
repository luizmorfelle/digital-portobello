class TechLibraryTab {
  final int id;
  final String title;

  TechLibraryTab(this.id, this.title);

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
