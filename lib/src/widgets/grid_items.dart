import 'package:digital_portobello/src/models/card_item_model.dart';
import 'package:digital_portobello/src/utils/translate.dart';
import 'package:digital_portobello/src/widgets/card_item.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

import '../utils/constants.dart';

class GridItems extends StatelessWidget {
  final Future<List<CardItemModel>> futureItems;
  const GridItems({super.key, required this.futureItems});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureItems,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final items = snapshot.data!;
          return items.isEmpty
              ? Text(tl('product_not_found', context))
              : GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        MediaQuery.of(context).size.width ~/ cardItemSize,
                    mainAxisExtent: cardItemSize + textSpaceSize,
                    // childAspectRatio: 4 / 3,
                    crossAxisSpacing: 15.0,
                    mainAxisSpacing: 15.0,
                  ),
                  itemCount: items.length,
                  itemBuilder: (_, index) {
                    return CardItem(
                      cardItem: items[index],
                    );
                  });
        } else if (snapshot.hasError) {
          return Center(
            child: Text('${snapshot.error} - ${snapshot.stackTrace}'),
          );
        } else {
          return Skeleton(
              isLoading: true,
              skeleton: Flexible(
                child: Row(
                  children: List.filled(
                      MediaQuery.of(context).size.width ~/ cardItemSize,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                              height: cardItemSize, width: cardItemSize - 16),
                        ),
                      )),
                ),
              ),
              child: Container());
        }
      },
    );
  }
}
