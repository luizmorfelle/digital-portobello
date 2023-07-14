import 'package:carousel_slider/carousel_slider.dart';
import 'package:digital_portobello/src/models/card_item_model.dart';
import 'package:digital_portobello/src/widgets/card_item.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class SliderItems extends StatefulWidget {
  const SliderItems({
    super.key,
    required this.itens,
  });

  final List<CardItemModel> itens;

  @override
  State<SliderItems> createState() => _SliderItemsState();
}

class _SliderItemsState extends State<SliderItems> {
  CarouselController buttonCarouselController = CarouselController();

  int pageIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          carouselController: buttonCarouselController,
          options: CarouselOptions(
              height: CARD_ITEM_SIZE + TEXT_SPACE_SIZE + 20,
              initialPage: 2,
              onPageChanged: (index, reason) {
                setState(() {
                  pageIndex = index;
                });
              },
              animateToClosest: false,
              viewportFraction:
                  (1 / (MediaQuery.of(context).size.width / CARD_ITEM_SIZE)),
              enableInfiniteScroll: true),
          items: widget.itens.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CardItem(cardItem: item),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(
          height: CARD_ITEM_SIZE,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  buttonCarouselController.previousPage();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shadowColor: Colors.white24,
                  minimumSize: const Size(50, 50),
                  side: const BorderSide(color: Colors.black, width: 2),
                ),
                child: const Icon(Icons.arrow_back, color: Colors.black),
              ),
              ElevatedButton(
                onPressed: () {
                  buttonCarouselController.nextPage();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shadowColor: Colors.white24,
                  minimumSize: const Size(50, 50),
                  side: const BorderSide(color: Colors.black, width: 2),
                ),
                child: const Icon(Icons.arrow_forward, color: Colors.black),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
