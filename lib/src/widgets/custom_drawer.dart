import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 8,
        width: 350,
        child: ListView(
          children: [
            DrawerHeader(
                child: Flex(
              direction: Axis.vertical,
              children: const [
                Expanded(
                  child: Image(
                      fit: BoxFit.contain,
                      image: AssetImage(
                          'assets/images/PORTOBELLO_LOGO_PRETO.png')),
                ),
                Text('Digital Portobello')
              ],
            )),
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              leading: const Icon(Icons.search),
              title: Text(
                'Pesquisa Técnica',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              iconColor: Colors.black,
              onTap: () {},
            ),
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              leading: const Icon(Icons.content_paste_search_rounded),
              title: Text(
                'Todos ambientes',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              iconColor: Colors.black,
              onTap: () {},
            ),
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              leading: const Icon(Icons.menu_book_sharp),
              title: Text(
                'Biblioteca Técnica',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              iconColor: Colors.black,
              onTap: () {},
            ),
          ],
        ));
  }
}
