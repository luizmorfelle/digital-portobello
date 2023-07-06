import 'package:digital_portobello/src/models/dropdown_model.dart';
import 'package:digital_portobello/src/utils/translate.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../utils/constants.dart';
import '../providers/sales_channel_provider.dart';
import 'custom_dropdown_button.dart';

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
                    tl('advanced_search', context),
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
                    tl('tech_search', context),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  iconColor: Colors.black,
                  onTap: () => context.push('/all-spaces/1'),
                ),
                ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  leading: const Icon(Icons.menu_book_sharp),
                  title: Text(
                    tl('tech_lib', context),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  iconColor: Colors.black,
                  onTap: () => context.push('/tech-library'),
                ),
                ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  title: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Canal de Venda'),
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
                Divider(),
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
