import 'package:digital_portobello/src/models/breadcrumb_item_model.dart';
import 'package:digital_portobello/src/models/space_model.dart';
import 'package:digital_portobello/src/models/space_n1_model.dart';

import 'constants.dart';

List<BreadCrumbItemModel> generateBreadcrumbs(
    SpaceModel? spaceModel, SpaceN1Model? spaceN1Model) {
  if (spaceModel == null && spaceN1Model == null) return [];
  return [
    BreadCrumbItemModel(name: 'Home', path: '/'),
    if (spaceModel != null)
      BreadCrumbItemModel(
          name: usages
              .firstWhere((it) => it.id == spaceModel.usoId.toString())
              .value,
          path: ''),
    if (spaceN1Model != null)
      BreadCrumbItemModel(
          name: surfaces
              .firstWhere(
                  (it) => it.id == spaceN1Model.superficiesID.toString())
              .value,
          path: ''),
    if (spaceModel != null)
      BreadCrumbItemModel(name: spaceModel.title, path: ''),
    if (spaceN1Model != null)
      BreadCrumbItemModel(name: spaceN1Model.title, path: ''),
  ];
}
