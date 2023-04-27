class CardItemModel {
  int id;
  String path;
  String imagem;
  String nome;
  String? description;

  CardItemModel({
    required this.id,
    required this.path,
    required this.imagem,
    required this.nome,
    this.description,
  });
}
