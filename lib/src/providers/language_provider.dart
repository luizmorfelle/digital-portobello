import 'package:digital_portobello/src/l10n/l10n.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale language = L10n.all[0];

  setLanguage(String code) {
    language = L10n.all.firstWhere((element) => element.languageCode == code);
    notifyListeners();
  }
}
