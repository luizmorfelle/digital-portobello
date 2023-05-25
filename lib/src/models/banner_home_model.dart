import 'package:digital_portobello/src/models/banner_model.dart';

class BannerHomeModel extends BannerModel {
  String? titulo;
  String? texto;
  String? posicao;
  int ordem = 0;
  Null? dataExpiracao;
  String? status;
  String? aplicacao;
  String? idsAplicacao;
  int? padrao;

  BannerHomeModel({
    super.id,
    super.image,
    this.titulo,
    this.texto,
    this.posicao,
    required this.ordem,
    this.dataExpiracao,
    this.status,
    this.aplicacao,
    this.idsAplicacao,
    this.padrao,
  });

  BannerHomeModel.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    titulo = json['Titulo'];
    texto = json['Texto'];
    posicao = json['Posicao'];
    image = json['Imagem'];
    ordem = json['Ordem'];
    dataExpiracao = json['DataExpiracao'];
    status = json['Status'];
    aplicacao = json['Aplicacao'];
    idsAplicacao = json['IdsAplicacao'];
    padrao = json['Padrao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['Titulo'] = this.titulo;
    data['Texto'] = this.texto;
    data['Posicao'] = this.posicao;
    data['Imagem'] = this.image;
    data['Ordem'] = this.ordem;
    data['DataExpiracao'] = this.dataExpiracao;
    data['Status'] = this.status;
    data['Aplicacao'] = this.aplicacao;
    data['IdsAplicacao'] = this.idsAplicacao;
    data['Padrao'] = this.padrao;
    return data;
  }
}
