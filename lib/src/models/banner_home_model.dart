import 'package:digital_portobello/src/models/banner_model.dart';

class BannerHomeModel extends BannerModel {
  String? titulo;
  String? texto;
  String? posicao;
  int ordem = 0;
  String? dataExpiracao;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = id;
    data['Titulo'] = titulo;
    data['Texto'] = texto;
    data['Posicao'] = posicao;
    data['Imagem'] = image;
    data['Ordem'] = ordem;
    data['DataExpiracao'] = dataExpiracao;
    data['Status'] = status;
    data['Aplicacao'] = aplicacao;
    data['IdsAplicacao'] = idsAplicacao;
    data['Padrao'] = padrao;
    return data;
  }
}
