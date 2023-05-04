import 'package:digital_portobello/src/models/card_item_model.dart';
import 'package:digital_portobello/src/models/material_model.dart';
import 'package:digital_portobello/src/models/product_line_model.dart';
import 'package:digital_portobello/src/models/product_model.dart';
import 'package:digital_portobello/src/models/space_model.dart';
import 'package:digital_portobello/src/models/space_n2_model.dart';

class Mock {
  List<String> images = List.of([
    "CHARLESTON_BANNER_GRANDE_GW1MEYn.jpg",
    "GAIA_JADE_BANNER_GRANDE.jpg",
    "MALIBU_LAKE_BANNER_GRANDE.jpg",
    "VERANO_CIELO_BANNER_GRANDE.jpg"
  ]);

  List<CardItemModel> lines = List.of([
    LineProductModel(
      id: 1,
      imagem:
          'assets/images/products/barlavento-caribbean-relevo-14-5x14-5-ext_16558.jpg',
      nome: 'ASA DELTA CEMENT',
    ),
    LineProductModel(
      id: 1,
      imagem: 'assets/images/products/artsy-cement-90x90-ext_11345.jpg',
      nome: 'ARTSY CEMENT',
    ),
  ]);

  List<ProductModel> products = List.of([
    ProductModel(
      id: 1,
      codProduto: '204637',
      tipo: 'Porcelanato Esmaltado',
      description: 'ASA DELTA CEMENT 30X42',
      borda: 'RET',
      reproducao: 'MARMORE',
      acabamento: 'NAT',
      aplicacao: 'PISO',
      colorBody: 'N',
      pecaCaixa: '2',
      faces: '1',
      espessura: '9.5',
      corRejunte: 'CINZA',
      m2caixa: '1.44',
      varTonalidade: 'V3',
      juntaAssentamento: '2',
      imagem: 'assets/images/products/artsy-cement-90x90-ext_11345.jpg',
      descProduto: 'ASA DELTA CEMENT',
      nome: 'ASA DELTA CEMENT',
      linha: 'GAVEA',
      codLinha: '433',
      sufixo: 'E',
      descFormatoNominal: '30X42.5',
    ),
    ProductModel(
      id: 1,
      codProduto: '28899',
      imagem: 'assets/images/products/artsy-cement-90x90-nat_11343.jpg',
      descProduto: 'ASA DELTA CEMENT',
      nome: 'ASA DELTA CEMENT',
      linha: 'GAVEA',
      codLinha: '433',
      sufixo: 'ET',
      descFormatoNominal: '30X42.5',
    ),
    ProductModel(
      id: 1,
      codProduto: '28899',
      imagem: 'assets/images/products/artsy-cement-90x90-pol_11344.jpg',
      descProduto: 'ASA DELTA CEMENT',
      nome: 'ASA DELTA CEMENT',
      linha: 'GAVEA',
      codLinha: '433',
      sufixo: 'ET',
      descFormatoNominal: '30X42.5',
    ),
    ProductModel(
      id: 1,
      codProduto: '28899',
      imagem:
          'assets/images/products/barlavento-caribbean-relevo-14-5x14-5-ext_16558.jpg',
      descProduto: 'ASA DELTA CEMENT',
      nome: 'ASA DELTA CEMENT',
      linha: 'GAVEA',
      codLinha: '433',
      sufixo: 'ET',
      descFormatoNominal: '30X42.5',
    ),
    ProductModel(
      id: 1,
      codProduto: '28899',
      imagem:
          'assets/images/products/barlavento-gris-relevo-14-5x14-5-ext_16556.jpg',
      descProduto: 'ASA DELTA CEMENT',
      nome: 'ASA DELTA CEMENT',
      linha: 'GAVEA',
      codLinha: '433',
      sufixo: 'ET',
      descFormatoNominal: '30X42.5',
    ),
    ProductModel(
      id: 1,
      codProduto: '28899',
      imagem:
          'assets/images/products/barlavento-lagoon-relevo-14-5x14-5-ext_16585.jpg',
      descProduto: 'ASA DELTA CEMENT',
      nome: 'ASA DELTA CEMENT',
      linha: 'GAVEA',
      codLinha: '433',
      sufixo: 'ET',
      descFormatoNominal: '30X42.5',
    ),
    ProductModel(
      id: 1,
      codProduto: '28899',
      imagem:
          'assets/images/products/barlavento-sea-relevo-14-5x14-5-ext_16574.jpg',
      descProduto: 'ASA DELTA CEMENT',
      nome: 'ASA DELTA CEMENT',
      linha: 'GAVEA',
      codLinha: '433',
      sufixo: 'ET',
      descFormatoNominal: '30X42.5',
    ),
  ]);

  List<CardItemModel> materiais = List.of([
    MaterialModel(
      id: 1,
      imagem: 'assets/images/materials/concreto.jpg',
      nome: 'Concreto',
    ),
    MaterialModel(
      id: 2,
      imagem: 'assets/images/materials/madeira.jpg',
      nome: 'Madeira',
    ),
    MaterialModel(
      id: 3,
      imagem: 'assets/images/materials/pedra.jpg',
      nome: 'Pedra',
    ),
    MaterialModel(
      id: 4,
      imagem: 'assets/images/materials/argila.jpg',
      nome: 'Argila',
    ),
    MaterialModel(
      id: 5,
      imagem: 'assets/images/materials/metal.jpg',
      nome: 'Metal',
    ),
    MaterialModel(
      id: 6,
      imagem: 'assets/images/materials/marmore.jpg',
      nome: 'Mármore',
    ),
    MaterialModel(
      id: 7,
      imagem: 'assets/images/materials/terrazzo.jpg',
      nome: 'Terrazzo',
    ),
    MaterialModel(
      id: 8,
      imagem: 'assets/images/materials/sintetico.jpg',
      nome: 'Sintético',
    ),
    MaterialModel(
      id: 9,
      imagem: 'assets/images/materials/quartzites.jpg',
      nome: 'Quartzites',
    ),
  ]);

  List<CardItemModel> ambientes = List.of([
    SpaceModel(
      id: 1,
      imagem: 'assets/images/spaces/Banheiro.jpg',
      nome: 'Banheiro',
    ),
    SpaceModel(
      id: 1,
      imagem: 'assets/images/spaces/Jantar.jpg',
      nome: 'Sala de Jantar',
    ),
    SpaceModel(
      id: 1,
      imagem: 'assets/images/spaces/SalaEstar.jpg',
      nome: 'Sala de Estar',
    ),
  ]);

  List<CardItemModel> ambientesN2 = List.of([
    SpaceN2Model(
      id: 1,
      imagem:
          'assets/images/spacesN2/Banheiro_com_chuveiro__uso_comum__revenda-ambiente-28642-e-mare-d-autunno-90x90-3d-1-versao_mais_recente.jpg',
      nome: 'Banheiro com Chuveiro',
    ),
    SpaceN2Model(
      id: 1,
      imagem:
          'assets/images/spacesN2/Banheiro_com_chuveiro__uso_privado__-_HOTEL_revenda-ambiente-29386-29395-e-krea-ripple-sidewalk-10x40-amb-1-versao_mais_recente.jpg',
      nome: 'Banheiro sem Chuveiro',
    ),
    SpaceN2Model(
      id: 1,
      imagem:
          'assets/images/spacesN2/Banheiro_com_chuveiro__uso_privado__revenda-ambiente-12277-200068-e-michelangelo-3d-1-versao_mais_recente.jpg',
      nome: 'Lavabo',
    ),
  ]);
}
