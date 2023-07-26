import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/favorite_provider.dart';
import '../../utils/translate.dart';

class DeleteAllButton extends StatelessWidget {
  const DeleteAllButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Provider.of<FavoriteProvider>(context, listen: false)
            .removeAllFavoriteProduct();
      },
      icon: const Icon(Icons.delete),
      label: Text(tl('delete_all', context)),
    );
  }
}
