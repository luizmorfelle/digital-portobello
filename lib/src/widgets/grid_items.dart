import 'package:digital_portobello/src/models/card_item_model.dart';
import 'package:digital_portobello/src/utils/translate.dart';
import 'package:digital_portobello/src/widgets/card_item.dart';
import 'package:flutter/material.dart';

class GridItems extends StatelessWidget {
  final List<CardItemModel> items;
  const GridItems({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return items.isEmpty
        ? Text(tl('product_not_found', context))
        : GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
            ),
            itemCount: items.length,
            itemBuilder: (_, index) {
              return CardItem(cardItem: items[index]);
            });
  }
}
