import 'package:digital_portobello/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/card_item_model.dart';
import '../utils/translate.dart';

class CardItem extends StatelessWidget {
  final CardItemModel cardItem;
  const CardItem({super.key, required this.cardItem});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push('/${cardItem.path}'),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Flex(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          direction: Axis.vertical,
          children: [
            Expanded(
              child: cardItem.imagem != null
                  ? Image.asset(
                      errorBuilder: (context, error, stackTrace) =>
                          const Center(
                        child: Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                      ),
                      cardItem.imagem ?? "",
                      width: double.infinity,
                      height: CARD_ITEM_SIZE,
                      fit: cardItem.isFull ? BoxFit.fill : BoxFit.contain,
                    )
                  : const Placeholder(),
            ),
            SizedBox(
              height: TEXT_SPACE_SIZE,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tl(cardItem.nome ?? "", context),
                    maxLines: 3,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  if (cardItem.description != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          tl(cardItem.description ?? "", context),
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
