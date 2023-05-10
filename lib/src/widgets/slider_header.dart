import 'package:carousel_slider/carousel_slider.dart';
import 'package:digital_portobello/src/models/banner_model.dart';
import 'package:flutter/material.dart';

class SliderHeader extends StatelessWidget {
  const SliderHeader({super.key, required this.images});
  final Future<List<BannerModel>> images;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BannerModel>>(
      future: images,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CarouselSlider(
            options: CarouselOptions(
                height: 300.0,
                initialPage: 1,
                viewportFraction: 1,
                autoPlay: true,
                enlargeCenterPage: true),
            items: snapshot.data?.map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Image(
                          fit: BoxFit.cover,
                          height: 200,
                          image: AssetImage(
                              'assets/images/banners/${image.imagem}')));
                },
              );
            }).toList(),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
