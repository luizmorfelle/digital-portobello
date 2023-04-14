import 'package:digital_portobello/src/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:badges/badges.dart' as badges;

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: preferredSize.height,
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black, size: 50),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    iconSize: 50,
                    hoverColor: Colors.white,
                    tooltip: 'Home',
                    icon: const Icon(Icons.house),
                    onPressed: () {
                      context.push('/');
                    }),
                IconButton(
                    iconSize: 50,
                    hoverColor: Colors.white,
                    tooltip: 'Idiomas',
                    icon: const Icon(Icons.language),
                    onPressed: () {})
              ],
            ),
          ),
          GestureDetector(
            onTap: () => context.push('/'),
            child: const Image(
                fit: BoxFit.contain,
                height: 200,
                image: AssetImage('assets/images/PORTOBELLO_LOGO_PRETO.png')),
          ),
          badges.Badge(
            position: badges.BadgePosition.topEnd(top: 5, end: 5),
            showBadge: true,
            ignorePointer: false,
            onTap: () {},
            badgeContent: Text(
              '3',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            child: IconButton(
                iconSize: 50,
                hoverColor: Colors.white,
                tooltip: 'Favoritos',
                icon: const Icon(Icons.favorite),
                onPressed: () => context.push('/favorites')),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
