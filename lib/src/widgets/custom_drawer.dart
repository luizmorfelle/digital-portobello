import 'package:digital_portobello/src/models/dropdown_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../providers/sales_channel.dart';
import 'custom_dropdown_button.dart';

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
              onTap: () => context.push('/tech-search'),
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
              onTap: () => context.push('/all-spaces'),
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
              onTap: () => context.push('/tech-library'),
            ),
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              title: CustomDropdownButton(
                items: salesChannels,
                value:
                    Provider.of<SalesChannelProvider>(context).getSaleChannel,
                onChange: (value) {
                  Provider.of<SalesChannelProvider>(context, listen: false)
                      .setSaleChannel(value as DropDownModel);
                },
              ),
            ),
          ],
        ));
  }
}
