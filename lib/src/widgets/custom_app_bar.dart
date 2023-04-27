import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
                    onPressed: () {})
              ],
            ),
          ),
          GestureDetector(
            onTap: () => context.push('/'),
            child: Image(
                fit: BoxFit.contain,
                height: preferredSize.height * 2,
                image: AssetImage('assets/images/PORTOBELLO_LOGO_PRETO.png')),
          ),
          badges.Badge(
            position: badges.BadgePosition.topEnd(top: 5, end: 5),
            showBadge: true,
            ignorePointer: false,
            onTap: () {},
            badgeContent: Text(
              '3',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                  ),
            ),
            child: IconButton(
                iconSize: preferredSize.height / 2,
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
