import 'package:badges/badges.dart' as badges;
import 'package:digital_portobello/src/providers/favorite_provider.dart';
import 'package:digital_portobello/src/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'dialogs/dialog_laguage.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.32;

    return AppBar(
      toolbarHeight: preferredSize.height,
      backgroundColor: Colors.white,
      centerTitle: true,
      actions: [
        SizedBox(
          width: size,
          child: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              iconSize: preferredSize.height / (isSmall(context) ? 2.5 : 2),
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
          ),
        ),
      ],
      iconTheme: const IconThemeData(color: Colors.black, size: 50),
      leadingWidth: size,
      leading: Padding(
        padding: const EdgeInsets.only(left: 6.0),
        child: Row(
          children: [
            if (isSmall(context) &&
                context.canPop() &&
                ModalRoute.of(context)?.settings.name != "/")
              IconButton(
                  iconSize: preferredSize.height / (isSmall(context) ? 2.5 : 2),
                  icon: const Icon(Icons.arrow_back_ios),
                  hoverColor: Colors.white,
                  onPressed: () {
                    context.pop();
                  }),
            IconButton(
                iconSize: preferredSize.height / (isSmall(context) ? 2.5 : 2),
                icon: const Icon(Icons.menu),
                hoverColor: Colors.white,
                onPressed: () => Scaffold.of(context).openDrawer()),
            if (!isSmall(context))
              IconButton(
                iconSize: preferredSize.height / (isSmall(context) ? 2.5 : 2),
                hoverColor: Colors.white,
                tooltip: 'Home',
                icon: const Icon(Icons.house),
                onPressed: () {
                  context.push('/');
                },
              ),
            if (!isSmall(context))
              IconButton(
                iconSize: preferredSize.height / (isSmall(context) ? 2.5 : 2),
                hoverColor: Colors.white,
                tooltip: 'Idiomas',
                icon: const Icon(Icons.language),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const DialogLanguage();
                    },
                  );
                },
              )
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
