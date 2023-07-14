import 'package:badges/badges.dart' as badges;
import 'package:country_flags/country_flags.dart';
import 'package:digital_portobello/src/providers/favorite_provider.dart';
import 'package:digital_portobello/src/providers/language_provider.dart';
import 'package:digital_portobello/src/utils/translate.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: preferredSize.height,
      backgroundColor: Colors.white,
      centerTitle: true,
      actions: [
        IconButton(
          iconSize: preferredSize.height / 2,
          hoverColor: Colors.white,
          tooltip: 'Favoritos',
          icon: badges.Badge(
            position: badges.BadgePosition.topEnd(top: 0, end: -5),
            showBadge: true,
            ignorePointer: false,
            onTap: () {},
            badgeContent: Text(
              Provider.of<FavoriteProvider>(context)
                  .getFavoriteProducts
                  .length
                  .toString(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                  ),
            ),
            child: const Icon(Icons.favorite),
          ),
          onPressed: () => context.push('/favorites'),
        ),
      ],
      iconTheme: const IconThemeData(color: Colors.black, size: 50),
      leadingWidth: 250,
      leading: Padding(
        padding: const EdgeInsets.only(left: 6.0),
        child: Row(
          children: [
            IconButton(
                icon: const Icon(Icons.menu),
                hoverColor: Colors.white,
                onPressed: () => Scaffold.of(context).openDrawer()),
            IconButton(
                iconSize: preferredSize.height / 2,
                hoverColor: Colors.white,
                tooltip: 'Home',
                icon: const Icon(Icons.house),
                onPressed: () {
                  context.push('/');
                }),
            IconButton(
                iconSize: preferredSize.height / 2,
                hoverColor: Colors.white,
                tooltip: 'Idiomas',
                icon: const Icon(Icons.language),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          insetPadding: EdgeInsets.only(bottom: 300),
                          title: Text(tl('language', context)),
                          content: SizedBox(
                            height: 200,
                            width: 300,
                            child: ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: ListTile(
                                    leading: CountryFlag.fromCountryCode(
                                      'BR',
                                      height: 48,
                                      width: 62,
                                      borderRadius: 8,
                                    ),
                                    title: Text(tl('portugues', context)),
                                    onTap: () {
                                      Provider.of<LanguageProvider>(context,
                                              listen: false)
                                          .setLanguage('pt');
                                      context.pop();
                                    },
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: ListTile(
                                    leading: CountryFlag.fromCountryCode(
                                      'US',
                                      height: 48,
                                      width: 62,
                                      borderRadius: 8,
                                    ),
                                    title: Text(tl('ingles', context)),
                                    onTap: () {
                                      Provider.of<LanguageProvider>(context,
                                              listen: false)
                                          .setLanguage('en');
                                      context.pop();
                                    },
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: ListTile(
                                    leading: CountryFlag.fromCountryCode(
                                      'ES',
                                      height: 48,
                                      width: 62,
                                      borderRadius: 8,
                                    ),
                                    title: Text(tl('espanhol', context)),
                                    onTap: () {
                                      Provider.of<LanguageProvider>(context,
                                              listen: false)
                                          .setLanguage('es');

                                      context.pop();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                })
          ],
        ),
      ),
      title: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => context.push('/'),
          child: Image(
              fit: BoxFit.contain,
              height: preferredSize.height * 2,
              image:
                  const AssetImage('assets/images/PORTOBELLO_LOGO_PRETO.png')),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
