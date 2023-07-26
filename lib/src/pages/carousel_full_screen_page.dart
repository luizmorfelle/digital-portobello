import 'package:carousel_slider/carousel_slider.dart';
import 'package:digital_portobello/src/models/banner_model.dart';
import 'package:digital_portobello/src/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class CarouselFullScreenPage extends StatefulWidget {
  const CarouselFullScreenPage(
      {Key? key, required this.images, required this.actualIndex})
      : super(key: key);
  final int actualIndex;
  final List<BannerModel> images;

  @override
  State<CarouselFullScreenPage> createState() => _CarouselFullScreenPageState();
}

class _CarouselFullScreenPageState extends State<CarouselFullScreenPage> {
  CarouselController buttonCarouselController = CarouselController();
  int pageIndex = 0;
  bool autoPlay = false;

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: FocusNode(),
      onKeyEvent: (value) {
        if (value.logicalKey == LogicalKeyboardKey.arrowLeft) {
          buttonCarouselController.previousPage();
        } else if (value.logicalKey == LogicalKeyboardKey.arrowRight) {
          buttonCarouselController.nextPage();
        } else if (value.logicalKey == LogicalKeyboardKey.escape ||
            value.logicalKey == LogicalKeyboardKey.backspace) {
          context.pop();
        }
      },
      child: Center(
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
                  pageSnapping: true,
                  initialPage: widget.actualIndex,
                  viewportFraction: .85,
                  autoPlay: false,
                  enableInfiniteScroll: widget.images.length > 1,
                  enlargeCenterPage: true),
              items: widget.images.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: InteractiveViewer(
                          child: Image.asset(
                            'assets/images/banners/${image.image}',
                            errorBuilder: (context, error, stackTrace) {
                              return Image.network(
                                'https://media.portobello.com.br/${image.image}',
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Placeholder();
                                },
                              );
                            },
                            fit: BoxFit.contain,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          color: Colors.white),
                      child: const Icon(Icons.close,
                          color: Colors.black, size: 50))),
            ),
            if (widget.images.length > 1)
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
                      side: const BorderSide(color: Colors.black, width: 2),
                    ),
                    child: const Icon(Icons.arrow_forward, color: Colors.black),
                  ),
                ),
              ),
            if (widget.images.length > 1)
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
                      side: const BorderSide(color: Colors.black, width: 2),
                    ),
                    child: const Icon(Icons.arrow_back, color: Colors.black),
                  ),
                ),
              ),
            if (widget.images.length > 1)
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
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
                      ),
                      if (!isSmall(context))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: widget.images
                              .map(
                                (e) => Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      buttonCarouselController.animateToPage(
                                          widget.images.indexOf(e));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 6),
                                      width: 15,
                                      height: 15,
                                      decoration: BoxDecoration(
                                        color: widget.images.indexOf(e) ==
                                                pageIndex
                                            ? Colors.black
                                            : Colors.white,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
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
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
