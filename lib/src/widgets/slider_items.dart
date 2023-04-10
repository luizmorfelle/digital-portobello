import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../pages/enviroment_page.dart';

class SliderItems extends StatelessWidget {
  const SliderItems({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: 350.0,
          initialPage: 2,
          animateToClosest: false,
          viewportFraction: 0.3,
          enableInfiniteScroll: false),
      items: images.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const EnviromentPage(
                  id: 1,
                ),
              )),
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
                        child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/$image')),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Text("Ambiente"),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
