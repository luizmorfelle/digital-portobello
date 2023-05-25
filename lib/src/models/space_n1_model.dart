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

  SpaceN1Model(
      {this.id,
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
      this.tag});

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['AmbientesID'] = this.ambientesID;
    data['SuperficiesID'] = this.superficiesID;
    data['Title'] = this.title;
    data['Description'] = this.description;
    data['Ativo'] = this.ativo;
    data['Image'] = this.image;
    data['HomePage'] = this.homePage;
    data['CoeficienteAtritoMolhado'] = this.coeficienteAtritoMolhado;
    data['LocalUso'] = this.localUso;
    data['AbsorcaoAgua'] = this.absorcaoAgua;
    data['ResistenciaManchas'] = this.resistenciaManchas;
    data['ResAtaQuimicoAlta'] = this.resAtaQuimicoAlta;
    data['ResAtaQuimicoBaixa'] = this.resAtaQuimicoBaixa;
    data['ExpansaoPorUmidade'] = this.expansaoPorUmidade;
    data['AcabamentoSuperficie'] = this.acabamentoSuperficie;
    data['Tag'] = this.tag;
    return data;
  }
}
