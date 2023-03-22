import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mysql1/mysql1.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          appBar: AppBar(
            toolbarHeight: 120,
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black, size: 50),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(Icons.menu),
                    Container(
                      margin: const EdgeInsets.only(top: 30, right: 10),
                      child: Column(
                        children: const [Icon(Icons.house), Text('Home')],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: Column(
                        children: const [Icon(Icons.language), Text('Idioma')],
                      ),
                    ),
                  ],
                ),
                const Image(
                    fit: BoxFit.contain,
                    height: 200,
                    image: AssetImage('assets/PORTOBELLO_LOGO_PRETO.png')),
                const Icon(Icons.favorite)
              ],
            ),
          ),
          body: Column(
            children: [
              _buildSliderHeader(images),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term',
                ),
              ),
            ],
          )),
    );
  }

  CarouselSlider _buildSliderHeader(List<String> images) {
    return CarouselSlider(
      options: CarouselOptions(height: 400.0, initialPage: 1),
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
                    image: AssetImage('assets/$image')));
          },
        );
      }).toList(),
    );
  }
}
