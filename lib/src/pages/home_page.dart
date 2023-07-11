import 'package:digital_portobello/src/controllers/materials_controller.dart';
import 'package:digital_portobello/src/controllers/spaces_controller.dart';
import 'package:digital_portobello/src/models/banner_home_model.dart';
import 'package:digital_portobello/src/models/breadcrumb_item_model.dart';
import 'package:digital_portobello/src/models/dropdown_model.dart';
import 'package:digital_portobello/src/models/material_model.dart';
import 'package:digital_portobello/src/models/space_home_model.dart';
import 'package:digital_portobello/src/widgets/custom_breadcrumb.dart';
import 'package:digital_portobello/src/widgets/custom_dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';

import '../controllers/banners_controller.dart';
import '../providers/language_provider.dart';
import '../utils/constants.dart';
import '../utils/translate.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/see_all_spaces_button.dart';
import '../widgets/slider_header.dart';
import '../widgets/slider_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController spaceController = TextEditingController();
  final TextEditingController useController = TextEditingController();

  DropDownModel? selectedUsage;
  DropDownModel? selectedSurface;
  late Future<List<BannerHomeModel>> futureBanners;
  late Future<List<SpaceHomeModel>> futureSpaces;
  late Future<List<MaterialModel>> futureMaterials;

  @override
  void initState() {
    super.initState();
    futureBanners = fetchBanners();
    selectedUsage = usages.first;
    selectedSurface = surfaces.first;
    futureSpaces = fetchSpaces(selectedUsage?.id, selectedSurface?.id);
    futureMaterials = fetchMaterials();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SliderHeader(images: futureBanners),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: CustomTextField(
                      onSubmitted: (value) => context
                          .push('/product/${value.split('-')[0].trim()}'),
                    ),
                  ),
                  Row(
                    children: [
                      Wrap(
                        spacing: 35,
                        direction: Axis.horizontal,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        clipBehavior: Clip.antiAlias,
                        children: [
                          Text(
                            tl('choose_environment', context).toUpperCase(),
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          CustomDropdownButton(
                            items: usages,
                            value: selectedUsage!,
                            onChange: (value) {
                              setState(() {
                                if (value?.id == '3') {
                                  context.push(
                                      '/all-spaces/${selectedSurface!.id}');
                                  return;
                                }
                                selectedUsage = value;
                                futureSpaces = fetchSpaces(
                                    selectedUsage?.id, selectedSurface?.id);
                              });
                            },
                          ),
                          CustomDropdownButton(
                            items: surfaces,
                            value: selectedSurface!,
                            onChange: (value) {
                              setState(() {
                                selectedSurface = value;
                                futureSpaces = fetchSpaces(
                                    selectedUsage?.id, selectedSurface?.id);
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomBreadCrumb(items: [
                        BreadCrumbItemModel(name: 'Home', path: '/'),
                        BreadCrumbItemModel(
                            name: tl(selectedUsage!.value, context), path: ''),
                        BreadCrumbItemModel(
                            name: tl(selectedSurface!.value, context),
                            path: ''),
                      ]),
                      SeeAllSpacesButton(
                        surfaceId: selectedSurface?.id,
                      )
                    ],
                  ),
                  FutureBuilder(
                    future: futureSpaces,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return SliderItems(itens: snapshot.data!);
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error} ${snapshot.stackTrace}');
                      }
                      return Skeleton(
                          isLoading: true,
                          skeleton: Flex(
                            direction: Axis.horizontal,
                            children: List.filled(
                                MediaQuery.of(context).size.width ~/
                                    CARD_ITEM_SIZE,
                                const Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: SkeletonAvatar(
                                      style: SkeletonAvatarStyle(
                                          height: CARD_ITEM_SIZE,
                                          width: CARD_ITEM_SIZE),
                                    ),
                                  ),
                                )),
                          ),
                          child: Container());
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  FutureBuilder(
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return SliderItems(itens: snapshot.data!);
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error} ${snapshot.stackTrace}');
                      }
                      return Skeleton(
                          isLoading: true,
                          skeleton: Flex(
                            direction: Axis.horizontal,
                            children: List.filled(
                                MediaQuery.of(context).size.width ~/
                                    CARD_ITEM_SIZE,
                                const Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: SkeletonAvatar(
                                      style: SkeletonAvatarStyle(
                                          height: CARD_ITEM_SIZE,
                                          width: CARD_ITEM_SIZE),
                                    ),
                                  ),
                                )),
                          ),
                          child: Container());
                    },
                    future: futureMaterials,
                  ),
                ],
              ),
            ),
            Container(
              child: Image.asset(
                  'assets/images/banners_footer/${Provider.of<LanguageProvider>(context, listen: false).language.languageCode}.png'),
            )
          ],
        ),
      ),
    );
  }
}
