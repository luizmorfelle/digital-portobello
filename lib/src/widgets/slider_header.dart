import 'package:carousel_slider/carousel_slider.dart';
import 'package:digital_portobello/src/models/banner_model.dart';
import 'package:digital_portobello/src/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

import '../pages/carousel_full_screen_page.dart';

class SliderHeader extends StatefulWidget {
  const SliderHeader({super.key, required this.images});
  final Future<List<BannerModel>>? images;

  @override
  State<SliderHeader> createState() => _SliderHeaderState();
}

class _SliderHeaderState extends State<SliderHeader> {
  CarouselController buttonCarouselController = CarouselController();
  int pageIndex = 0;
  double heightBanner = 500;
  bool autoPlay = true;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BannerModel>>(
      future: widget.images,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return snapshot.data!.isEmpty
              ? Container()
              : SizedBox(
                  height: heightBanner,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CarouselSlider(
                        carouselController: buttonCarouselController,
                        options: CarouselOptions(
                            onPageChanged: (index, reason) {
                              setState(() {
                                pageIndex = index;
                              });
                            },
                            height: heightBanner,
                            initialPage: 0,
                            viewportFraction: 1,
                            autoPlay: autoPlay,
                            enableInfiniteScroll: snapshot.data!.length > 1,
                            enlargeCenterPage: true),
                        items: snapshot.data?.map((image) {
                          return Builder(
                            builder: (BuildContext context) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CarouselFullScreenPage(
                                                images: snapshot.data ?? [],
                                                actualIndex: pageIndex),
                                      ));
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.asset(
                                    'assets/images/banners/${image.image}',
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.network(
                                        image.image!.startsWith("http")
                                            ? image.image!
                                            : 'https://media.portobello.com.br/${image.image}',
                                        width: heightBanner,
                                        height: heightBanner,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return const Placeholder();
                                        },
                                      );
                                    },
                                    fit: BoxFit.cover,
                                    height: heightBanner,
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CarouselFullScreenPage(
                                            images: snapshot.data ?? [],
                                            actualIndex: pageIndex),
                                  ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                  color: Colors.white),
                              child: const Icon(Icons.fullscreen,
                                  color: Colors.black, size: 50),
                            ),
                          ),
                        ),
                      ),
                      if (snapshot.data!.length > 1)
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ElevatedButton(
                              onPressed: () {
                                buttonCarouselController.nextPage();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shadowColor: Colors.white24,
                                minimumSize: const Size(50, 50),
                                side: const BorderSide(
                                    color: Colors.black, width: 2),
                              ),
                              child: const Icon(Icons.arrow_forward,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      if (snapshot.data!.length > 1)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ElevatedButton(
                              onPressed: () {
                                buttonCarouselController.previousPage();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shadowColor: Colors.white24,
                                minimumSize: const Size(50, 50),
                                side: const BorderSide(
                                    color: Colors.black, width: 2),
                              ),
                              child: const Icon(Icons.arrow_back,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      if (snapshot.data!.length > 1 && !isSmall(context))
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      autoPlay = true;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: snapshot.data!
                                      .map(
                                        (e) => InkWell(
                                          onTap: () {
                                            buttonCarouselController
                                                .animateToPage(
                                                    snapshot.data!.indexOf(e));
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 6),
                                            width: 10,
                                            height: 10,
                                            decoration: BoxDecoration(
                                              color:
                                                  snapshot.data!.indexOf(e) ==
                                                          pageIndex
                                                      ? Colors.black
                                                      : Colors.white,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 2,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      autoPlay = false;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.stop,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error} - ${snapshot.stackTrace}');
        } else if (widget.images == null) {
          return Container();
        }
        return Skeleton(
            isLoading: true,
            skeleton: SkeletonAvatar(
              style: SkeletonAvatarStyle(
                width: double.infinity,
                minHeight: heightBanner,
                maxHeight: heightBanner + 1,
              ),
            ),
            child: Container());
      },
    );
  }
}
