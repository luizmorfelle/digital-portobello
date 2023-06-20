import 'package:digital_portobello/src/models/tech_library_tab.dart';
import 'package:digital_portobello/src/pages/list_lines_product_page.dart';
import 'package:digital_portobello/src/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';

import '../controllers/lines_controller.dart';
import '../controllers/tech_library_controller.dart';
import '../utils/fields_tech_search.dart';
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
                        bottom: TabBar(
                          indicatorColor: Colors.white,
                          labelStyle: TextStyle(color: Colors.white),
                          labelColor: Colors.white,
                          unselectedLabelStyle: TextStyle(color: Colors.white),
                          tabs: snapshot.data!
                              .map((e) => Tab(
                                    text: e.title,
                                  ))
                              .toList(),
                        ),
                      ),
                      body: TabBarView(
                        children: snapshot.data!
                            .map((e) => Text(
                                  e.title,
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
}
