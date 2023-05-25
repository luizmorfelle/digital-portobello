import 'package:digital_portobello/src/models/product_model.dart';
import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  List<ProductModel> favoriteProducts = [];

  List<ProductModel> get getFavoriteProducts {
    return favoriteProducts;
  }

  void addFavoriteProduct(ProductModel product) {
    favoriteProducts.add(product);
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
