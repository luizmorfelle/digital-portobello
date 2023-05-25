import 'package:digital_portobello/src/models/banner_model.dart';

class BannerSurfaceModel extends BannerModel {
  String? tags;
  String? imagem;
  String? produto;
  String? canalVenda;

  BannerSurfaceModel({
    super.id,
    super.image,
    this.tags,
    this.imagem,
    this.produto,
    this.canalVenda,
  });

  BannerSurfaceModel.fromJson(Map<String, dynamic> json) {
    super.id = json['ID'];
    super.image = json['Imagem'];
    tags = json['Tags'];
    produto = json['Produto'];
    canalVenda = json['CanalVenda'];
  }
}
