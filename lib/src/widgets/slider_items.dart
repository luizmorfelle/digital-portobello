import 'package:carousel_slider/carousel_slider.dart';
import 'package:digital_portobello/src/models/card_item_model.dart';
import 'package:digital_portobello/src/widgets/card_item.dart';
import 'package:flutter/material.dart';

class SliderItems extends StatelessWidget {
  const SliderItems({
    super.key,
    required this.itens,
  });

  final List<CardItemModel> itens;
  final double cardSize = 400.0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: cardSize,
          initialPage: 2,
          animateToClosest: false,
          viewportFraction:
              (1 / (MediaQuery.of(context).size.width / cardSize)),
          enableInfiniteScroll: false),
      items: itens.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return CardItem(cardItem: item);
          },
        );
      }).toList(),
    );
  }
}
