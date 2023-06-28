import 'package:digital_portobello/src/models/tech_library_tab.dart';
import 'package:digital_portobello/src/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_youtube_view/flutter_youtube_view.dart';
import 'package:pdf/pdf.dart';

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
          Row(
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
                  height: 500,
                  child: DefaultTabController(
                    length: snapshot.data!.length,
                    child: Scaffold(
                      appBar: AppBar(
                        automaticallyImplyLeading: false,
                        title: TabBar(
                          padding: EdgeInsets.zero,
                          indicatorColor: Colors.black,
                          labelStyle:
                              TextStyle(color: Colors.white, fontSize: 18),
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
                                        FlutterYoutubeView(
                                            scaleMode: YoutubeScaleMode
                                                .none, // <option> fitWidth, fitHeight
                                            params: YoutubeParam(
                                                videoId: 'NMs-EP6Z2OQ',
                                                showUI: false,
                                                startSeconds: 0.0, // <option>
                                                autoPlay: false) // <option>
                                            ),
                                        Text('${e.files![index].title}')
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
}
