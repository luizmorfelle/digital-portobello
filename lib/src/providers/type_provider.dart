import 'package:flutter/material.dart';

class TypeProvider extends ChangeNotifier {
  String type = 'totem';

  void setType(String type) {
    this.type = type;
    notifyListeners();
  }
}
