import 'package:digital_portobello/src/models/space_model.dart';

class SpaceN1Model {
  int? id;
  int? ambientesID;
  int? superficiesID;
  String? title;
  String? description;
  String? ativo;
  String? image;
  String? homePage;
  String? coeficienteAtritoMolhado;
  String? localUso;
  String? absorcaoAgua;
  String? resistenciaManchas;
  String? resAtaQuimicoAlta;
  String? resAtaQuimicoBaixa;
  String? expansaoPorUmidade;
  String? acabamentoSuperficie;
  String? tag;
  SpaceModel? spaceModel;

  SpaceN1Model({
    this.id,
    this.ambientesID,
    this.superficiesID,
    this.title,
    this.description,
    this.ativo,
    this.image,
    this.homePage,
    this.coeficienteAtritoMolhado,
    this.localUso,
    this.absorcaoAgua,
    this.resistenciaManchas,
    this.resAtaQuimicoAlta,
    this.resAtaQuimicoBaixa,
    this.expansaoPorUmidade,
    this.acabamentoSuperficie,
    this.tag,
    this.spaceModel,
  });

  factory SpaceN1Model.fromJson(Map<String, dynamic> json) {
    return SpaceN1Model(
        id: json['ID'],
        ambientesID: json['AmbientesID'],
        superficiesID: json['SuperficiesID'],
        title: json['Title'],
        description: json['Description'],
        ativo: json['Ativo'],
        image: json['Image'],
        homePage: json['HomePage'],
        coeficienteAtritoMolhado: json['CoeficienteAtritoMolhado'],
        localUso: json['LocalUso'],
        absorcaoAgua: json['AbsorcaoAgua'],
        resistenciaManchas: json['ResistenciaManchas'],
        resAtaQuimicoAlta: json['ResAtaQuimicoAlta'],
        resAtaQuimicoBaixa: json['ResAtaQuimicoBaixa'],
        expansaoPorUmidade: json['ExpansaoPorUmidade'],
        acabamentoSuperficie: json['AcabamentoSuperficie'],
        tag: json['Tag']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = id;
    data['AmbientesID'] = ambientesID;
    data['SuperficiesID'] = superficiesID;
    data['Title'] = title;
    data['Description'] = description;
    data['Ativo'] = ativo;
    data['Image'] = image;
    data['HomePage'] = homePage;
    data['CoeficienteAtritoMolhado'] = coeficienteAtritoMolhado;
    data['LocalUso'] = localUso;
    data['AbsorcaoAgua'] = absorcaoAgua;
    data['ResistenciaManchas'] = resistenciaManchas;
    data['ResAtaQuimicoAlta'] = resAtaQuimicoAlta;
    data['ResAtaQuimicoBaixa'] = resAtaQuimicoBaixa;
    data['ExpansaoPorUmidade'] = expansaoPorUmidade;
    data['AcabamentoSuperficie'] = acabamentoSuperficie;
    data['Tag'] = tag;
    return data;
  }
}
