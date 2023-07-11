import 'package:digital_portobello/src/models/field_tech_search.dart';
import 'package:digital_portobello/src/pages/list_products_page.dart';
import 'package:digital_portobello/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/card_item_model.dart';
import '../utils/translate.dart';

class CardItem extends StatelessWidget {
  final CardItemModel cardItem;
  const CardItem({
    super.key,
    required this.cardItem,
    this.fieldTechSearch,
  });
  final List<FieldTechSearch>? fieldTechSearch;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        InkWell(
          onTap: () {
            if (fieldTechSearch == null) {
              context.push('/${cardItem.path}');
            } else {
              var split = cardItem.path?.split("/");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListProductsPage(
                        groupId: split?[split.length == 4 ? 3 : 2],
                        spaceN1Id: split?.length == 4 ? (split?[2]) : null,
                        fieldsTechSearch: fieldTechSearch),
                  ));
            }
          },
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
        ),
        if (cardItem.simulador != null &&
            cardItem.simulador!.isNotEmpty &&
            cardItem.simulador == "S")
          Positioned(
            top: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(0.9),
              ),
              child: Icon(Icons.remove_red_eye, size: 35, color: Colors.white),
            ),
          ),
      ],
    );
  }
}
