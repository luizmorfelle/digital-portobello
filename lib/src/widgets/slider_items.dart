import 'package:carousel_slider/carousel_slider.dart';
import 'package:digital_portobello/src/models/card_item_model.dart';
import 'package:digital_portobello/src/widgets/card_item.dart';
import 'package:flutter/material.dart';

class SliderItems extends StatefulWidget {
  SliderItems({
    super.key,
    required this.itens,
  });

  final List<CardItemModel> itens;

  @override
  State<SliderItems> createState() => _SliderItemsState();
}

class _SliderItemsState extends State<SliderItems> {
  CarouselController buttonCarouselController = CarouselController();

  final double cardSize = 380.0;
  int pageIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          carouselController: buttonCarouselController,
          options: CarouselOptions(
              height: cardSize,
              initialPage: 2,
              onPageChanged: (index, reason) {
                setState(() {
                  if (index == 1 || index == widget.itens.length - 2) {
                    buttonCarouselController.jumpToPage(pageIndex);
                    return;
                  }
                  pageIndex = index;
                });
              },
              animateToClosest: false,
              viewportFraction:
                  (1 / (MediaQuery.of(context).size.width / cardSize)),
              enableInfiniteScroll: false),
          items: widget.itens.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return CardItem(cardItem: item);
              },
            );
          }).toList(),
        ),
        SizedBox(
          height: cardSize,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    if (pageIndex == 2) return;
                    buttonCarouselController.previousPage();
                  },
                  icon: Icon(Icons.arrow_back)),
              IconButton(
                  onPressed: () {
                    if (pageIndex == widget.itens.length - 3) return;
                    buttonCarouselController.nextPage();
                  },
                  icon: Icon(Icons.arrow_forward)),
            ],
          ),
        ),
      ],
    );
  }
}
