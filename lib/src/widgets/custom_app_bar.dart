import 'package:digital_portobello/src/pages/home_page.dart';
import 'package:flutter/material.dart';

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
                      if (ModalRoute.of(context)?.settings.name != '/') {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ));
                      }
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
          const Image(
              fit: BoxFit.contain,
              height: 200,
              image: AssetImage('assets/images/PORTOBELLO_LOGO_PRETO.png')),
          IconButton(
              iconSize: 50,
              hoverColor: Colors.white,
              tooltip: 'Favoritos',
              icon: const Icon(Icons.favorite),
              onPressed: () {})
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
