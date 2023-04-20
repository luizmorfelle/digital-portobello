import 'package:digital_portobello/src/models/card_item_model.dart';
import 'package:digital_portobello/src/models/material_model.dart';
import 'package:digital_portobello/src/models/product_model.dart';
import 'package:digital_portobello/src/models/space_model.dart';

class Mock {
  List<String> images = List.of([
    "CHARLESTON_BANNER_GRANDE_GW1MEYn.jpg",
    "GAIA_JADE_BANNER_GRANDE.jpg",
    "MALIBU_LAKE_BANNER_GRANDE.jpg",
    "VERANO_CIELO_BANNER_GRANDE.jpg"
  ]);

  List<ProductModel> products = List.of([
    ProductModel(
      id: 1,
      codProduto: '28899',
      imagem: 'assets/images/products/charleston.jpg',
      descProduto: 'ASA DELTA CEMENT',
      linha: 'GAVEA',
      codLinha: '433',
      sufixo: 'ET',
      descFormatoNominal: '30X42.5',
    ),
  ]);

  List<CardItemModel> materiais = List.of([
    MaterialModel(
      id: 1,
      imagem: 'assets/images/materiais/concreto.jpg',
      nome: 'Concreto',
    ),
    MaterialModel(
      id: 2,
      imagem: 'assets/images/materiais/madeira.jpg',
      nome: 'Madeira',
    ),
    MaterialModel(
      id: 3,
      imagem: 'assets/images/materiais/pedra.jpg',
      nome: 'Pedra',
    ),
    MaterialModel(
      id: 4,
      imagem: 'assets/images/materiais/argila.jpg',
      nome: 'Argila',
    ),
    MaterialModel(
      id: 5,
      imagem: 'assets/images/materiais/metal.jpg',
      nome: 'Metal',
    ),
    MaterialModel(
      id: 6,
      imagem: 'assets/images/materiais/marmore.jpg',
      nome: 'Mármore',
    ),
    MaterialModel(
      id: 7,
      imagem: 'assets/images/materiais/terrazzo.jpg',
      nome: 'Terrazzo',
    ),
    MaterialModel(
      id: 8,
      imagem: 'assets/images/materiais/sintetico.jpg',
      nome: 'Sintético',
    ),
    MaterialModel(
      id: 9,
      imagem: 'assets/images/materiais/quartzites.jpg',
      nome: 'Quartzites',
    ),
  ]);

  List<CardItemModel> ambientes = List.of([
    SpaceModel(
      id: 1,
      imagem: 'assets/images/ambientes/Banheiro.jpg',
      nome: 'Banheiro',
    ),
    SpaceModel(
      id: 1,
      imagem: 'assets/images/ambientes/Jantar.jpg',
      nome: 'Sala de Jantar',
    ),
    SpaceModel(
      id: 1,
      imagem: 'assets/images/ambientes/SalaEstar.jpg',
      nome: 'Sala de Estar',
    ),
  ]);
}
