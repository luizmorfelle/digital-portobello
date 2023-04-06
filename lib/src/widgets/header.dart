import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 120,
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
                const Icon(Icons.menu),
                Column(
                  children: [
                    IconButton(
                      iconSize: 50,
                      hoverColor: Colors.white,
                      tooltip: 'Home',
                      icon: const Icon(Icons.house),
                      onPressed: () {},
                    )
                  ],
                ),
                Column(
                  children: const [Icon(Icons.language)],
                ),
              ],
            ),
          ),
          const Image(
              fit: BoxFit.contain,
              height: 200,
              image: AssetImage('assets/images/PORTOBELLO_LOGO_PRETO.png')),
          const Icon(Icons.favorite)
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
