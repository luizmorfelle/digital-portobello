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
                      cardItem.imagem ?? "",
                      width: double.infinity,
                      fit: BoxFit.fill,
                    )
                  : const Placeholder(),
            ),
            SizedBox(
              height: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tl(cardItem.nome ?? "", context),
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
