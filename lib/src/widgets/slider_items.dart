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

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: 350.0,
          initialPage: 2,
          animateToClosest: false,
          viewportFraction: 0.3,
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
