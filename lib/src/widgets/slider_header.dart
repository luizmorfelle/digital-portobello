import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderHeader extends StatelessWidget {
  const SliderHeader({super.key, required this.images});
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: 300.0,
          initialPage: 1,
          viewportFraction: 1,
          autoPlay: true,
          enlargeCenterPage: true),
      items: images.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: const BoxDecoration(color: Colors.amber),
                child: Image(
                    fit: BoxFit.cover,
                    height: 200,
                    image: AssetImage('assets/images/$image')));
          },
        );
      }).toList(),
    );
  }
}
