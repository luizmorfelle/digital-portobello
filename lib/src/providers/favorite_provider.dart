import 'package:digital_portobello/src/models/product_model.dart';
import 'package:digital_portobello/src/models/space_n1_model.dart';
import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  Map<ProductModel, SpaceN1Model?> favoriteProducts = {};

  Map<ProductModel, SpaceN1Model?> get getFavoriteProducts {
    return favoriteProducts;
  }

  void addFavoriteProduct(ProductModel product, SpaceN1Model? space) {
    favoriteProducts[product] = space;
    notifyListeners();
  }

  void removeFavoriteProduct(ProductModel product) {
    favoriteProducts.remove(product);
    notifyListeners();
  }

  void removeAllFavoriteProduct() {
    favoriteProducts.clear();
    notifyListeners();
  }
}
