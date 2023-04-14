import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/card_item_model.dart';

class CardItem extends StatelessWidget {
  final CardItemModel cardItem;
  const CardItem({super.key, required this.cardItem});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push('/spaces'),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Flex(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            direction: Axis.vertical,
            children: [
              Expanded(
                child: Image.asset(
                  fit: BoxFit.fitWidth,
                  cardItem.imagem,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Text(cardItem.nome),
              )
            ],
          ),
        ),
      ),
    );
  }
}
