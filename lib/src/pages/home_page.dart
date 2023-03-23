import 'package:carousel_slider/carousel_slider.dart';
import 'package:digital_portobello/src/widgets/header.dart';
import 'package:flutter/material.dart';

import '../widgets/slider_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> images = List.of([
      "CHARLESTON_BANNER_GRANDE_GW1MEYn.jpg",
      "GAIA_JADE_BANNER_GRANDE.jpg",
      "MALIBU_LAKE_BANNER_GRANDE.jpg",
      "VERANO_CIELO_BANNER_GRANDE.jpg"
    ]);

    return MaterialApp(
      title: 'Flutter layout demo',
      theme: ThemeData(primarySwatch: Colors.grey, fontFamily: 'Helvetica'),
      home: Scaffold(
          appBar: const Header(),
          body: Column(
            children: [
              SliderHeader(images: images),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.search),
                          hintText: 'Buscar',
                        ),
                      ),
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                          height: 200.0,
                          animateToClosest: false,
                          viewportFraction: 0.2,
                          enableInfiniteScroll: false),
                      items: images.map((image) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Card(
                              child: Wrap(
                                children: [
                                  Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                      ),
                                      child: Image(
                                          fit: BoxFit.cover,
                                          image: AssetImage('assets/$image'))),
                                  Text("Ambiente")
                                ],
                              ),
                            );
                          },
                        );
                      }).toList(),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
