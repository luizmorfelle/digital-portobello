import 'package:digital_portobello/src/models/card_item_model.dart';

class ProductModel extends CardItemModel {
  String? codProduto;
  String? sufixo;
  String? descProduto;
  String? descFormatoNominal;
  String? codLinha;
  String? linha;

  ProductModel(
      {required super.id,
      codProduto,
      sufixo,
      descProduto,
      descFormatoNominal,
      codLinha,
      linha,
      super.path = 'product',
      required super.imagem,
      required super.nome,
      super.description});
}
