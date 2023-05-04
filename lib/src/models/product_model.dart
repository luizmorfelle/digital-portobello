import 'package:digital_portobello/src/models/card_item_model.dart';

class ProductModel extends CardItemModel {
  String? codProduto;
  String? sufixo;
  String? descProduto;
  String? descFormatoNominal;
  String? codLinha;
  String? linha;
  String? tipo;
  String? borda;
  String? reproducao;
  String? acabamento;
  String? aplicacao;
  String? colorBody;
  String? pecaCaixa;
  String? faces;
  String? espessura;
  String? corRejunte;
  String? m2caixa;
  String? varTonalidade;
  String? juntaAssentamento;
  String? absorcaoAgua;
  String? coefAtritoMolhado;
  String? uso;
  String? resManchas;
  String? resAtqQuiBaixaConc;
  String? resAtqQuiAltaConc;
  String? expUmidade;

  ProductModel(
      {this.codProduto,
      this.sufixo,
      this.descProduto,
      this.descFormatoNominal,
      this.codLinha,
      this.linha,
      this.tipo,
      this.borda,
      this.reproducao,
      this.acabamento,
      this.aplicacao,
      this.colorBody,
      this.pecaCaixa,
      this.faces,
      this.espessura,
      this.corRejunte,
      this.m2caixa,
      this.varTonalidade,
      this.juntaAssentamento,
      this.absorcaoAgua,
      this.coefAtritoMolhado,
      this.uso,
      this.resManchas,
      this.resAtqQuiBaixaConc,
      this.resAtqQuiAltaConc,
      this.expUmidade,
      required super.id,
      super.path = 'product',
      required super.imagem,
      required super.nome});

  Map<String, String?> toJson() => {
        'Sku': codProduto! + sufixo!,
        'Tipo': tipo,
        'Borda': borda,
        'Reprodução': reproducao,
        'Acabamento': acabamento,
        'Formato': descFormatoNominal,
        'Aplicação': aplicacao,
        'Color Body': colorBody,
        'Peça/caixa': pecaCaixa,
        'Número de faces': faces,
        'Espessura': espessura,
        'Cor Rejunte': corRejunte,
        'm²/caixa': m2caixa,
        'Var. de Tonalidade': varTonalidade,
        'Junta de Assentamento': juntaAssentamento,
      };
}
