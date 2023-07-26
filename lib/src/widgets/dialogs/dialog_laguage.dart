import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../providers/language_provider.dart';
import '../../utils/translate.dart';

class DialogLanguage extends StatelessWidget {
  const DialogLanguage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.only(bottom: 300),
      title: Text(tl('language', context)),
      content: SizedBox(
        height: 200,
        width: 300,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: CountryFlag.fromCountryCode(
                  'BR',
                  height: 48,
                  width: 62,
                  borderRadius: 8,
                ),
                title: Text(tl('portugues', context)),
                onTap: () {
                  Provider.of<LanguageProvider>(context, listen: false)
                      .setLanguage('pt');
                  context.pop();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: CountryFlag.fromCountryCode(
                  'US',
                  height: 48,
                  width: 62,
                  borderRadius: 8,
                ),
                title: Text(tl('ingles', context)),
                onTap: () {
                  Provider.of<LanguageProvider>(context, listen: false)
                      .setLanguage('en');
                  context.pop();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: CountryFlag.fromCountryCode(
                  'ES',
                  height: 48,
                  width: 62,
                  borderRadius: 8,
                ),
                title: Text(tl('espanhol', context)),
                onTap: () {
                  Provider.of<LanguageProvider>(context, listen: false)
                      .setLanguage('es');

                  context.pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
