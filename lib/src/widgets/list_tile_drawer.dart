import 'package:flutter/material.dart';

import '../utils/translate.dart';

class ListTileDrawer extends StatelessWidget {
  const ListTileDrawer({
    super.key,
    required this.title,
    required this.iconData,
    required this.action,
  });

  final String title;
  final IconData iconData;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      leading: Icon(iconData),
      title: Text(
        tl(title, context),
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      iconColor: Colors.black,
      onTap: action,
    );
  }
}
