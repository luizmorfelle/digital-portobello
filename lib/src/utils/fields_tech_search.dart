import '../models/field_tech_search.dart';
import '../models/item_field_tech_search.dart';

final List<FieldTechSearch> fieldsTechSearch = [
  FieldTechSearch(
    id: 0,
    title: 'Coeficiente de atrito molhado',
    fieldApi: 'atrito_molhado_iso',
    operatorApi: 'in',
    itens: [
      ItemFieldTechSearch(value: '0.1', label: '0,1'),
      ItemFieldTechSearch(value: '0.2', label: '0,2'),
      ItemFieldTechSearch(value: '0.3', label: '0,3'),
      ItemFieldTechSearch(value: '0.4', label: '0,4'),
      ItemFieldTechSearch(value: '0.5', label: '0,5'),
      ItemFieldTechSearch(value: '0.6', label: '0,6'),
      ItemFieldTechSearch(value: '0.7', label: '0,7'),
      ItemFieldTechSearch(value: '0.8', label: '0,8'),
    ],
  ),
  FieldTechSearch(
    id: 1,
    title: 'Local de Uso',
    fieldApi: 'uso',
    operatorApi: 'in',
    itens: [
      ItemFieldTechSearch(value: 'RE', label: 'RE'),
      ItemFieldTechSearch(value: 'PE', label: 'PE'),
      ItemFieldTechSearch(value: 'FA', label: 'FA'),
      ItemFieldTechSearch(value: 'RE', label: 'RE'),
      ItemFieldTechSearch(value: 'CL', label: 'CL'),
      ItemFieldTechSearch(value: 'CP', label: 'CP'),
      ItemFieldTechSearch(value: 'IU', label: 'IU'),
    ],
  ),
  FieldTechSearch(
    id: 2,
    title: 'Absorção de água',
    fieldApi: 'absorcao_dagua',
    operatorApi: 'in',
    itens: [
      ItemFieldTechSearch(value: '0.1', label: '0,1%'),
      ItemFieldTechSearch(value: '0.5', label: '0,5%'),
      ItemFieldTechSearch(value: '3', label: '3%'),
      ItemFieldTechSearch(value: '6', label: '6%'),
      ItemFieldTechSearch(value: '10', label: '10%'),
      ItemFieldTechSearch(value: '20', label: '20%'),
    ],
  ),
  FieldTechSearch(
    id: 3,
    title: 'Resistência à Manchas',
    fieldApi: 'resultado_minimo_limpeza',
    operatorApi: 'in',
    itens: [
      ItemFieldTechSearch(value: '1', label: '1'),
      ItemFieldTechSearch(value: '2', label: '2'),
      ItemFieldTechSearch(value: '3', label: '3'),
      ItemFieldTechSearch(value: '4', label: '4'),
      ItemFieldTechSearch(value: '5', label: '5'),
    ],
  ),
  FieldTechSearch(
    id: 4,
    title: 'Resistência ao ataque químico de ALTA concentração',
    fieldApi: 'ataque_qui_alta_conc',
    operatorApi: 'in',
    itens: [
      ItemFieldTechSearch(value: 'HA', label: 'HA'),
      ItemFieldTechSearch(value: 'HB', label: 'HB'),
      ItemFieldTechSearch(value: 'HC', label: 'HC'),
    ],
  ),
  FieldTechSearch(
    id: 5,
    title: 'Resistência ao ataque químico de BAIXA concentração',
    fieldApi: 'ataque_qui_baixa_conc',
    operatorApi: 'in',
    itens: [
      ItemFieldTechSearch(value: 'LA', label: 'LA'),
      ItemFieldTechSearch(value: 'LB', label: 'LB'),
      ItemFieldTechSearch(value: 'LC', label: 'LC'),
    ],
  ),
  FieldTechSearch(
    id: 6,
    title: 'Resistência a produto de limpeza',
    fieldApi: 'resultado_minimo_limpeza',
    operatorApi: 'in',
    itens: [
      ItemFieldTechSearch(value: '5', label: '5'),
      ItemFieldTechSearch(value: '3', label: '3'),
      ItemFieldTechSearch(value: '4', label: '4'),
    ],
  ),
  FieldTechSearch(
    id: 7,
    title: 'Expansão por umidade',
    fieldApi: 'expansao_por_umidade',
    operatorApi: 'in',
    itens: [
      ItemFieldTechSearch(value: '0.2', label: '0.2'),
      ItemFieldTechSearch(value: '0.3', label: '0.3'),
      ItemFieldTechSearch(value: '0.4', label: '0.4'),
      ItemFieldTechSearch(value: '0.5', label: '0.5'),
      ItemFieldTechSearch(value: '0.6', label: '0.6'),
    ],
  ),
  FieldTechSearch(
    id: 8,
    title: 'Tipologia Comercial',
    fieldApi: 'tipologia_comercial',
    operatorApi: 'in',
    itens: [
      ItemFieldTechSearch(
        value: 'PORCELANATO',
        label: 'Porcelanato',
      ),
      ItemFieldTechSearch(
        value: 'ESMALTADO',
        label: 'Esmaltado',
      ),
      ItemFieldTechSearch(
        value: 'PAREDE',
        label: 'Parede',
      ),
      ItemFieldTechSearch(
        value: 'MOSAICO',
        label: 'Mosaico',
      ),
      ItemFieldTechSearch(
        value: 'PORCELANATO',
        label: 'Porcelanato',
      ),
      ItemFieldTechSearch(
        value: 'PEÇAS ESPECIAIS',
        label: 'Peças Especiais',
      ),
      ItemFieldTechSearch(
        value: 'MOSAICO E CORTES ESPECIAIS',
        label: 'Mosaico E Cortes Especiais',
      ),
      ItemFieldTechSearch(
        value: 'MODULARE',
        label: 'Modulare',
      ),
      ItemFieldTechSearch(
        value: 'REVESTIMENTO',
        label: 'Revestimento',
      ),
    ],
  ),
  FieldTechSearch(
    id: 9,
    title: 'Características de acabamento',
    fieldApi: 'caracteristica_acabamento',
    operatorApi: 'in',
    itens: [
      ItemFieldTechSearch(value: 'NAT', label: 'NAT'),
      ItemFieldTechSearch(value: 'MATE', label: 'MATE'),
      ItemFieldTechSearch(value: 'POL', label: 'POL'),
      ItemFieldTechSearch(value: 'EXT', label: 'EXT'),
      ItemFieldTechSearch(value: 'BRILHO', label: 'BRILHO'),
      ItemFieldTechSearch(value: 'BRUTO', label: 'BRUTO'),
      ItemFieldTechSearch(value: 'RET', label: 'RET'),
      ItemFieldTechSearch(value: 'TACT', label: 'TACT'),
      ItemFieldTechSearch(value: 'OUTROS', label: 'OUTROS'),
    ],
  ),
  FieldTechSearch(
    id: 10,
    title: 'Acabamento de borda',
    fieldApi: 'acabamento_de_borda',
    operatorApi: 'in',
    itens: [
      ItemFieldTechSearch(value: 'RET', label: 'RET'),
      ItemFieldTechSearch(value: 'BOLD', label: 'BOLD'),
      ItemFieldTechSearch(value: 'FLAT - FT', label: 'FLAT - FT'),
      ItemFieldTechSearch(value: 'OUTROS', label: 'OUTROS'),
    ],
  ),
];
