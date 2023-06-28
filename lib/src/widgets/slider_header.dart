import 'package:carousel_slider/carousel_slider.dart';
import 'package:digital_portobello/src/models/banner_model.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class SliderHeader extends StatefulWidget {
  const SliderHeader({super.key, required this.images});
  final Future<List<BannerModel>>? images;

  @override
  State<SliderHeader> createState() => _SliderHeaderState();
}

class _SliderHeaderState extends State<SliderHeader> {
  CarouselController buttonCarouselController = CarouselController();
  int pageIndex = 1;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BannerModel>>(
      future: widget.images,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return snapshot.data!.isEmpty
              ? Container()
              : SizedBox(
                  height: 300,
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
                            height: 300.0,
                            initialPage: 1,
                            viewportFraction: 1,
                            autoPlay: true,
                            enableInfiniteScroll: snapshot.data!.length > 1,
                            enlargeCenterPage: true),
                        items: snapshot.data?.map((image) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                child: Image.asset(
                                  'assets/images/banners/${image.image}',
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.network(
                                      '${image.image}',
                                      width: 300,
                                      height: 300,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                  fit: BoxFit.cover,
                                  height: 300,
                                ),
                              );
                            },
                          );
                        }).toList(),
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
                      if (snapshot.data!.length > 1)
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {},
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
                                  onTap: () {},
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
                minHeight: 300,
                maxHeight: 301,
              ),
            ),
            child: Container());
      },
    );
  }
}
