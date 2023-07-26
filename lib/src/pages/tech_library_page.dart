import 'dart:typed_data';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:digital_portobello/src/models/tech_library_tab.dart';
import 'package:digital_portobello/src/widgets/buttons/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:internet_file/internet_file.dart';
import 'package:pdfx/pdfx.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/tech_library_controller.dart';
import '../utils/translate.dart';
import 'base_tech_page.dart';

class TechLibraryPage extends StatefulWidget {
  const TechLibraryPage({Key? key}) : super(key: key);

  @override
  TechLibraryPageState createState() => TechLibraryPageState();
}

class TechLibraryPageState extends State<TechLibraryPage> {
  late Future<List<TechLibraryTab>> futureTabs;
  @override
  void initState() {
    super.initState();
    futureTabs = fetchTechLibraryTabs();
  }

  @override
  Widget build(BuildContext context) {
    return BaseTechPage(
      title: tl('tech_lib', context).split(' ')[0],
      subTitle: tl('tech_lib', context).split(' ')[1],
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [CustomBackButton()],
          ),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder(
            future: futureTabs,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  height: 1000,
                  child: DefaultTabController(
                    length: snapshot.data!.length,
                    child: Scaffold(
                      appBar: AppBar(
                        automaticallyImplyLeading: false,
                        title: TabBar(
                          padding: EdgeInsets.zero,
                          indicatorColor: Colors.black,
                          labelStyle: const TextStyle(
                              color: Colors.white, fontSize: 18),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.grey,
                          // unselectedLabelStyle: TextStyle(color: Colors.red),
                          tabs: snapshot.data!
                              .map((e) => Tab(
                                    text: e.title,
                                  ))
                              .toList(),
                        ),
                      ),
                      body: TabBarView(
                        children: snapshot.data!
                            .map((e) => SingleChildScrollView(
                                  child: GridView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        crossAxisSpacing: 20.0,
                                        mainAxisSpacing: 20.0,
                                      ),
                                      itemCount: e.files?.length ?? 0,
                                      itemBuilder: (_, index) {
                                        return Card(
                                          child: Column(
                                            children: [
                                              e.files?[index].tipo == 'pdf'
                                                  ? Expanded(
                                                      child: SizedBox(
                                                        width: double.infinity,
                                                        child: InkWell(
                                                            onTap: () {
                                                              launchUrl(
                                                                  Uri.parse(e
                                                                      .files![
                                                                          index]
                                                                      .url!));
                                                            },
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                      color: Colors
                                                                              .grey[
                                                                          300]),
                                                              child: const Icon(
                                                                  Icons
                                                                      .picture_as_pdf,
                                                                  size: 40,
                                                                  color: Colors
                                                                      .black),
                                                            )),
                                                      ),
                                                    )
                                                  : Expanded(
                                                      child: SizedBox(
                                                        width: double.infinity,
                                                        child: InkWell(
                                                          onTap: () {
                                                            launchUrl(Uri.parse(
                                                                e.files![index]
                                                                    .url!));
                                                          },
                                                          child: Image.network(
                                                            getThumbnail(e
                                                                .files![index]
                                                                .url!),
                                                            errorBuilder:
                                                                (context, error,
                                                                    stackTrace) {
                                                              return Container(
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                            .grey[
                                                                        300]),
                                                                child: const Icon(
                                                                    Icons
                                                                        .play_circle_fill,
                                                                    size: 40,
                                                                    color: Colors
                                                                        .black),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: SizedBox(
                                                  height: 70,
                                                  child: Center(
                                                    child: AutoSizeText(
                                                      '${e.files![index].title}',
                                                      maxLines: 2,
                                                      minFontSize: 10,
                                                      maxFontSize: 17,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleLarge,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      }),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const Center(child: CircularProgressIndicator());
            },
          )
        ],
      ),
    );
  }

  String getThumbnail(String s) {
    String id = s.split('v=')[1];
    return 'https://img.youtube.com/vi/$id/0.jpg';
  }

  Future<Uint8List> getPdfPage(String url) async {
    return await PdfDocument.openData(InternetFile.get(url))
        .then((value) async {
      return await value.getPage(1).then((value2) async {
        return await value2.render(width: 200, height: 200).then((value) {
          return value!.bytes;
        });
      });
    });
  }
}
