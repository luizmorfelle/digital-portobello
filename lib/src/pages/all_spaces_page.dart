import 'package:digital_portobello/src/models/usage_model.dart';
import 'package:digital_portobello/src/pages/base_tech_page.dart';
import 'package:digital_portobello/src/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants.dart';
import '../controllers/spaces_controller.dart';
import '../models/dropdown_model.dart';
import '../widgets/custom_dropdown_button.dart';

class AllSpacesPage extends StatefulWidget {
  const AllSpacesPage({Key? key}) : super(key: key);

  @override
  State<AllSpacesPage> createState() => _AllSpacesPageState();
}

class _AllSpacesPageState extends State<AllSpacesPage> {
  DropDownModel? selectedSurface;
  late Future<List<UsageModel>> futureUsages;
  int indexUsage = 0;

  @override
  void initState() {
    super.initState();
    selectedSurface = surfaces.first;
    futureUsages = fetchAllSpacesBySurface(int.parse(selectedSurface!.id));
  }

  @override
  Widget build(BuildContext context) {
    return BaseTechPage(
        title: 'Todos',
        subTitle: 'Ambientes',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Selecione os filtros abaixo para apresentar os produtos',
                    style: Theme.of(context).textTheme.headlineMedium),
                const CustomBackButton()
              ],
            ),
            CustomDropdownButton(
              items: surfaces,
              value: selectedSurface!,
              onChange: (value) {
                setState(() {
                  selectedSurface = value;
                  futureUsages =
                      fetchAllSpacesBySurface(int.parse(selectedSurface!.id));
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: futureUsages,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                if (snapshot.hasData) {
                  return ExpansionPanelList.radio(
                    dividerColor: Colors.black,
                    children: snapshot.data!
                        .map((usage) => ExpansionPanelRadio(
                            backgroundColor: Colors.grey[200],
                            canTapOnHeader: true,
                            headerBuilder: (context, isExpanded) => ListTile(
                                  title: Text(
                                    usage.title!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  ),
                                ),
                            body: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: ExpansionPanelList.radio(
                                children: usage.spaces
                                    .map((ambient) => ExpansionPanelRadio(
                                        canTapOnHeader: true,
                                        backgroundColor: Colors.grey[100],
                                        headerBuilder: (context, isExpanded) =>
                                            ListTile(
                                                title: Text(
                                              ambient.title!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineMedium,
                                            )),
                                        body: Container(
                                          color: Colors.white,
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount:
                                                  ambient!.spacesN1.length,
                                              itemBuilder: (context, index) =>
                                                  ListTile(
                                                onTap: () => context.push(
                                                    '/lines/${ambient.spacesN1[index]!.id}'),
                                                title: Text(ambient
                                                    .spacesN1[index]!.title
                                                    .toString()),
                                              ),
                                            ),
                                          ),
                                        ),
                                        value: ambient.id.toString()))
                                    .toList(),
                              ),
                            ),
                            value: usage.iD!))
                        .toList(),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            )
          ],
        ));
  }
}
