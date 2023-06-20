import 'package:digital_portobello/src/l10n/en.dart';
import 'package:digital_portobello/src/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/es.dart';
import '../l10n/pt.dart';

String tl(String key, BuildContext context) {
  switch (Provider.of<LanguageProvider>(context).language.languageCode) {
    case 'pt':
      return pt[key] ?? key;
    case 'en':
      return en[key] ?? key;
    case 'es':
      return es[key] ?? key;
    default:
      return pt[key] ?? key;
  }
}
