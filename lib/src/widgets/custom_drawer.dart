import 'package:digital_portobello/src/utils/size.dart';
import 'package:digital_portobello/src/utils/translate.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/sales_channel_provider.dart';
import '../utils/constants.dart';
import 'custom_dropdown_button.dart';
import 'dialogs/dialog_laguage.dart';
import 'list_tile_drawer.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 8,
        width: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                DrawerHeader(
                    child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Expanded(
                      child: Image(
                          fit: BoxFit.contain,
                          image: AssetImage(
                              'assets/images/PORTOBELLO_LOGO_PRETO.png')),
                    ),
                    Text('Digital Portobello')
                  ],
                )),
                if (isSmall(context))
                  ListTileDrawer(
                    title: 'home',
                    action: () => context.push('/'),
                    iconData: Icons.home,
                  ),
                if (isSmall(context))
                  ListTileDrawer(
                    title: 'lang',
                    action: () => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const DialogLanguage();
                      },
                    ),
                    iconData: Icons.language,
                  ),
                ListTileDrawer(
                  title: 'advanced_search',
                  action: () => context.push('/tech-search'),
                  iconData: Icons.search,
                ),
                // ListTileDrawer(
                //   title: 'tech_search',
                //   action: () => context.push('/all-spaces/1'),
                //   iconData: Icons.content_paste_search_rounded,
                // ),
                ListTileDrawer(
                  title: 'tech_lib',
                  action: () => context.push('/tech-library'),
                  iconData: Icons.menu_book_sharp,
                ),
                ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  title: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(tl('Canal de Venda', context)),
                      CustomDropdownButton(
                        items: salesChannels,
                        value: Provider.of<SalesChannelProvider>(context)
                            .getSaleChannel,
                        onChange: (value) {
                          Provider.of<SalesChannelProvider>(context,
                                  listen: false)
                              .setSaleChannel(value!);
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Versão: 1.0.0',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
