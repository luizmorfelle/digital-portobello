import 'package:digital_portobello/src/models/tech_library_tab.dart';
import 'package:digital_portobello/src/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
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
                            .map((e) => GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
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
                                                child: SizedBox.expand(
                                                  child: InkWell(
                                                    onTap: () {
                                                      launchUrl(Uri.parse(e
                                                          .files![index].url!));
                                                    },
                                                    child: Expanded(
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Colors
                                                                    .grey[300]),
                                                        child: const Icon(
                                                            Icons
                                                                .picture_as_pdf,
                                                            size: 40,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : InkWell(
                                                onTap: () {
                                                  launchUrl(Uri.parse(
                                                      e.files![index].url!));
                                                },
                                                child: Stack(
                                                  children: [
                                                    Image.network(getThumbnail(
                                                        e.files![index].url!)),
                                                    const Positioned.fill(
                                                      child: Center(
                                                        child: Icon(
                                                          Icons.play_circle,
                                                          color: Colors.white,
                                                          size: 50,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Text(
                                            '${e.files![index].title}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }))
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
}
