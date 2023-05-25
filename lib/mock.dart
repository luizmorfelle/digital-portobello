import 'package:digital_portobello/src/models/card_item_model.dart';
import 'package:digital_portobello/src/models/material_model.dart';
import 'package:digital_portobello/src/models/product_line_model.dart';
import 'package:digital_portobello/src/models/product_model.dart';
import 'package:digital_portobello/src/models/space_model.dart';

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
}
