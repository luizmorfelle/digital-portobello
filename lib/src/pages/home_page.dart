import 'package:carousel_slider/carousel_slider.dart';
import 'package:digital_portobello/src/widgets/header.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:flutter/material.dart';

import '../widgets/slider_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        fontFamily: 'Helvetica',
      ),
      home: Scaffold(
          appBar: const Header(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SliderHeader(images: images),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.search),
                            hintText: 'Buscar',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 500,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("ESCOLHA OU SIMULE SEU AMBIENTE"),
                            SizedBox(
                              width: 200,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  DropdownButton<String>(
                                    value: 'Residencial',
                                    items: <String>[
                                      'Residencial',
                                      'Comercial',
                                      'Ver Todos'
                                    ].map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (_) {},
                                  ),
                                  DropdownButton<String>(
                                    value: 'Piso',
                                    items: <String>['Piso', 'Parede']
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (_) {},
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BreadCrumb(
                              items: <BreadCrumbItem>[
                                BreadCrumbItem(content: Text('Residencial')),
                                BreadCrumbItem(content: Text('Piso')),
                              ],
                              divider: Icon(Icons.chevron_right),
                            ),
                            ElevatedButton.icon(
                                onPressed: () => {},
                                icon: Icon(Icons.sync_alt),
                                label: Text("Ver Todos")),
                          ]),
                      CarouselSlider(
                        options: CarouselOptions(
                            height: 220.0,
                            animateToClosest: false,
                            initialPage: 2,
                            viewportFraction: 0.2,
                            enableInfiniteScroll: false),
                        items: images.map((image) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Card(
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Wrap(
                                    direction: Axis.vertical,
                                    children: [
                                      Container(
                                          child: Image(
                                              fit: BoxFit.cover,
                                              width: 300,
                                              image: AssetImage(
                                                  'assets/images/$image'))),
                                      Padding(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Text("Ambiente"))
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      CarouselSlider(
                        options: CarouselOptions(
                            height: 220.0,
                            animateToClosest: false,
                            initialPage: 2,
                            viewportFraction: 0.2,
                            enableInfiniteScroll: false),
                        items: images.map((image) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Card(
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Wrap(
                                    direction: Axis.vertical,
                                    children: [
                                      Container(
                                          child: Image(
                                              fit: BoxFit.cover,
                                              width: 300,
                                              image: AssetImage(
                                                  'assets/images/$image'))),
                                      Padding(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Text("Ambiente"))
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                SliderHeader(images: images),
              ],
            ),
          )),
    );
  }
}
