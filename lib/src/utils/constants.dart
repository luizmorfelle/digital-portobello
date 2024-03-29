import 'package:digital_portobello/src/models/dropdown_model.dart';

final List<DropDownModel> usages = [
  DropDownModel('1', 'Residencial'),
  DropDownModel('2', 'Comercial'),
  DropDownModel('3', 'see_all_2'),
];

final List<DropDownModel> surfaces = [
  DropDownModel('1', 'Piso'),
  DropDownModel('2', 'Parede'),
];

final List<DropDownModel> salesChannels = [
  DropDownModel('REV', 'Revenda', description: 'cv_revenda'),
  DropDownModel('ENG', 'Engenharia', description: 'cv_engenharia'),
  DropDownModel('PBS', 'Portobello Shop', description: 'cv_portobello_shop'),
  DropDownModel('EXP', 'Exportação', description: 'cv_exportacao'),
  DropDownModel('TOD', 'Todos', description: ''),
];

final List<DropDownModel> allUsages = [
  DropDownModel('CL', 'Comercial Leve'),
  DropDownModel('CP', 'Comercial Pesado'),
  DropDownModel('FA', 'Fachada'),
  DropDownModel('IU', 'Industrial e Urbano'),
  DropDownModel('PE', 'Parede Externa'),
  DropDownModel('RE', 'Residencial'),
  DropDownModel('RI', 'Revestimento Interno'),
];

double cardItemSize = 350;
double textSpaceSize = 80.0;
