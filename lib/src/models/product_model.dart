import 'package:digital_portobello/src/models/card_item_model.dart';

class ProductModel extends CardItemModel {
  int codProduto;
  String? sufixo;
  String? creationDate;
  String? lastUpdateDate;
  String? linha;
  int codLinha;
  String? descProduto;
  String? descFormatoNominal;
  String? descFormatoReal;
  String? transpasseMaximoMadeiras;
  String? lancamento;
  int codAplicacaoTecnica;
  String? aplicacaoTecnica;
  String? cor;
  String? udm;
  String? caracteristicaAcabamento;
  String? tipolAba;
  String? descTipologiaPrincipal;
  String? espessura;
  String? qtPcM2;
  double qtM2Caixa;
  int qtPcCaixa;
  String? qtPcCamada;
  String? qtPcPalletMi;
  String? qtM2PalletMi;
  String? qtCaixaPalletMi;
  String? qtPesoLiquido;
  String? qtPesoBruto;
  String? codVariacaoTonalidade;
  String? precoPeca;
  String? valorPalete;
  String? precoCaixa;
  String? qtdPesoLiqPeca;
  String? material;
  String? uso;
  String? residencial;
  String? areaComercialAltoTrafego;
  String? areaComercialMedioTrafego;
  String? piscina;
  String? areasExternas;
  String? varandasSacadas;
  String? fachadas;
  String? retro;
  String? mosaico;
  String? wallpaper;
  String? tijolinhoPedras;
  String? tecnicaDesign;
  String? filetesLondon;
  String? extraFino;
  String? vidroResina;
  String? porcelana;
  String? ceramicas;
  String? metal;
  String? piscinaInterna;
  String? piscinaBorda;
  String? piscinaAreaExterna;
  String? cvEngenharia;
  String? cvRevenda;
  String? cvPortobelloShop;
  String? cvExportacao;
  String? tags;
  String? acabamentoDeBorda;
  String? juntaDeAssentamento;
  String? grupo;
  String? epu;
  String? resistenciaMecanica;
  String? resistenciaAAbrasaoProfunda;
  String? resAbraSuperficial;
  double expansaoPorUmidade;
  String? cargaRuptura;
  String? agtManchVerdOlLeve;
  String? agtManchVermOlLeve;
  String? iodo;
  String? oleo;
  double absorcaoDagua;
  String? acidoCloridrico3;
  String? acidoCloridrico18;
  String? hidroxidoDePotassio30gl;
  String? hidroxidoDePotSsio100gl;
  String? acidoCitrico100gl;
  String? acidoLatico5;
  String? gretagemPort;
  String? gretagemIng;
  String? congelamentoPort;
  String? congelamentoIng;
  String? choqueTermicoPort;
  String? choqueTermicoIng;
  String? atritoSecoIso;
  double atritoMolhadoIso;
  String? atritoSecoAstm;
  String? atritoMolhadoAstm;
  String? absortancia;
  String? condTermTabelaco;
  String? calorEspTabelaco;
  String? densAparTabelaco;
  String? emissivTabelaco;
  String? absortanciaTabelaco;
  String? transmitTabelaco;
  String? coefAlphaTabelaco;
  String? coefIlumiTabelaco;
  String? impacDuroTabelaco;
  String? impacMoleTabelaco;
  String? resistUmidTabelaco;
  String? fv;
  String? ranking;
  String? selo;
  String? categoriaSite;
  String? rejunte;
  String? combinaCom;
  String? webStatus;
  String? normativa15463;
  String? normativa13818;
  String? normativa15575;
  String? normativa13006;
  String? normativa10545;
  String? normativaNa;
  String? coefExpansaoTerm;
  String? numGiros;
  String? cloretoAmonia100;
  String? hipocloritoSod20;
  String? ataqueQuiAltaConc;
  String? ataqueQuiBaixaConc;
  String? indiceRadSolar;
  String? refletancia;
  String? cargaConcentrada;
  String? ruidoImpacto;
  String? tipologiaComercial;
  String? nrFaces;
  String? atritoPendulo;
  String? colorBody;
  String? marca;
  String? inventoryItemID;
  String? deletedMark;
  String? indicacoesUso;
  String? origem;
  String? fornecedor;
  String? tipologiaCml;
  String? classPortifolio;
  String? classPortN2;
  String? classPortN3;
  String? classPortN4;
  String? descricaoLonga;
  String? codAntigo;
  String? codPrincipal;
  String? cvPorcelanateria;
  String? cvEngVarejo;
  String? eanCx;
  String? eanPc;
  String? resultadoMinimoManchantes;
  String? resultadoMinimoLimpeza;
  String? normativa16928;
  String? cvPbAmerica;
  String? juntaAssentamentoIs;
  String? juntaAssentamentoIm;
  String? juntaAssentamentoEf;
  String? juntaAssentamentoP;
  int groupColor;
  String? zoomImage;
  int enableforrevenda;
  String? briefing;
  bool checked = false;

  ProductModel({
    required super.id,
    required this.codProduto,
    required this.sufixo,
    this.creationDate,
    required this.lastUpdateDate,
    required this.linha,
    required this.codLinha,
    required this.descProduto,
    required this.descFormatoNominal,
    this.descFormatoReal,
    this.transpasseMaximoMadeiras,
    this.lancamento,
    required this.codAplicacaoTecnica,
    required this.aplicacaoTecnica,
    required this.cor,
    required this.udm,
    required this.caracteristicaAcabamento,
    required this.tipolAba,
    required this.descTipologiaPrincipal,
    required this.espessura,
    this.qtPcM2,
    required this.qtM2Caixa,
    required this.qtPcCaixa,
    this.qtPcCamada,
    this.qtPcPalletMi,
    this.qtM2PalletMi,
    this.qtCaixaPalletMi,
    this.qtPesoLiquido,
    this.qtPesoBruto,
    required this.codVariacaoTonalidade,
    this.precoPeca,
    this.valorPalete,
    this.precoCaixa,
    this.qtdPesoLiqPeca,
    required this.material,
    required this.uso,
    this.residencial,
    this.areaComercialAltoTrafego,
    this.areaComercialMedioTrafego,
    this.piscina,
    this.areasExternas,
    this.varandasSacadas,
    this.fachadas,
    this.retro,
    this.mosaico,
    this.wallpaper,
    this.tijolinhoPedras,
    this.tecnicaDesign,
    this.filetesLondon,
    this.extraFino,
    this.vidroResina,
    this.porcelana,
    this.ceramicas,
    this.metal,
    this.piscinaInterna,
    this.piscinaBorda,
    this.piscinaAreaExterna,
    required this.cvEngenharia,
    required this.cvRevenda,
    required this.cvPortobelloShop,
    required this.cvExportacao,
    required this.tags,
    required this.acabamentoDeBorda,
    required this.juntaDeAssentamento,
    this.grupo,
    this.epu,
    this.resistenciaMecanica,
    this.resistenciaAAbrasaoProfunda,
    this.resAbraSuperficial,
    required this.expansaoPorUmidade,
    required this.cargaRuptura,
    this.agtManchVerdOlLeve,
    this.agtManchVermOlLeve,
    this.iodo,
    this.oleo,
    required this.absorcaoDagua,
    this.acidoCloridrico3,
    this.acidoCloridrico18,
    this.hidroxidoDePotassio30gl,
    this.hidroxidoDePotSsio100gl,
    this.acidoCitrico100gl,
    this.acidoLatico5,
    this.gretagemPort,
    this.gretagemIng,
    this.congelamentoPort,
    this.congelamentoIng,
    this.choqueTermicoPort,
    this.choqueTermicoIng,
    required this.atritoSecoIso,
    required this.atritoMolhadoIso,
    required this.atritoSecoAstm,
    required this.atritoMolhadoAstm,
    this.absortancia,
    this.condTermTabelaco,
    this.calorEspTabelaco,
    this.densAparTabelaco,
    this.emissivTabelaco,
    this.absortanciaTabelaco,
    this.transmitTabelaco,
    this.coefAlphaTabelaco,
    this.coefIlumiTabelaco,
    this.impacDuroTabelaco,
    this.impacMoleTabelaco,
    this.resistUmidTabelaco,
    required this.fv,
    this.ranking,
    this.selo,
    required this.categoriaSite,
    required this.rejunte,
    required this.combinaCom,
    this.webStatus,
    this.normativa15463,
    this.normativa13818,
    this.normativa15575,
    this.normativa13006,
    this.normativa10545,
    this.normativaNa,
    this.coefExpansaoTerm,
    this.numGiros,
    required this.cloretoAmonia100,
    required this.hipocloritoSod20,
    required this.ataqueQuiAltaConc,
    required this.ataqueQuiBaixaConc,
    this.indiceRadSolar,
    this.refletancia,
    this.cargaConcentrada,
    this.ruidoImpacto,
    required this.tipologiaComercial,
    required this.nrFaces,
    this.atritoPendulo,
    required this.colorBody,
    required this.marca,
    this.inventoryItemID,
    this.deletedMark,
    this.indicacoesUso,
    this.origem,
    this.fornecedor,
    required this.tipologiaCml,
    this.classPortifolio,
    this.classPortN2,
    this.classPortN3,
    required this.classPortN4,
    this.descricaoLonga,
    this.codAntigo,
    this.codPrincipal,
    this.cvPorcelanateria,
    this.cvEngVarejo,
    this.eanCx,
    this.eanPc,
    this.resultadoMinimoManchantes,
    required this.resultadoMinimoLimpeza,
    this.normativa16928,
    this.cvPbAmerica,
    required this.juntaAssentamentoIs,
    required this.juntaAssentamentoIm,
    required this.juntaAssentamentoEf,
    required this.juntaAssentamentoP,
    required this.groupColor,
    required this.zoomImage,
    required this.enableforrevenda,
    this.briefing,
    super.simulador,
  }) : super(
            isFull: false,
            path: 'product/$id',
            imagem: "assets/images/products/$zoomImage",
            nome:
                '$descProduto $descFormatoNominal $caracteristicaAcabamento $acabamentoDeBorda');

  static ProductModel fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['ID'],
        codProduto: json['CodProduto'],
        sufixo: json['Sufixo'],
        creationDate: json['CreationDate'],
        lastUpdateDate: json['LastUpdateDate'],
        linha: json['Linha'],
        codLinha: json['CodLinha'],
        descProduto: json['DescProduto'],
        descFormatoNominal: json['DescFormatoNominal'],
        descFormatoReal: json['DescFormatoReal'],
        transpasseMaximoMadeiras: json['TranspasseMaximoMadeiras'],
        lancamento: json['Lancamento'],
        codAplicacaoTecnica: json['CodAplicacaoTecnica'],
        aplicacaoTecnica: json['AplicacaoTecnica'],
        cor: json['Cor'],
        udm: json['Udm'],
        caracteristicaAcabamento: json['CaracteristicaAcabamento'],
        tipolAba: json['TipolAba'],
        descTipologiaPrincipal: json['DescTipologiaPrincipal'],
        espessura: json['Espessura'],
        qtPcM2: json['QtPcM2'].toString(),
        qtM2Caixa: double.parse(json['QtM2Caixa'].toString()),
        qtPcCaixa: json['QtPcCaixa'],
        qtPcCamada: json['QtPcCamada'].toString(),
        qtPcPalletMi: json['QtPcPalletMi'].toString(),
        qtM2PalletMi: json['QtM2PalletMi'].toString(),
        qtCaixaPalletMi: json['QtCaixaPalletMi'].toString(),
        qtPesoLiquido: json['QtPesoLiquido'].toString(),
        qtPesoBruto: json['QtPesoBruto'].toString(),
        codVariacaoTonalidade: json['CodVariacaoTonalidade'],
        precoPeca: json['PrecoPeca'].toString(),
        valorPalete: json['ValorPalete'].toString(),
        precoCaixa: json['PrecoCaixa'].toString(),
        qtdPesoLiqPeca: json['QtdPesoLiqPeca'].toString(),
        material: json['Material'],
        uso: json['Uso'],
        residencial: json['Residencial'],
        areaComercialAltoTrafego: json['AreaComercialAltoTrafego'],
        areaComercialMedioTrafego: json['AreaComercialMedioTrafego'],
        piscina: json['Piscina'],
        areasExternas: json['AreasExternas'],
        varandasSacadas: json['VarandasSacadas'],
        fachadas: json['Fachadas'],
        retro: json['Retro'],
        mosaico: json['Mosaico'],
        wallpaper: json['Wallpaper'],
        tijolinhoPedras: json['TijolinhoPedras'],
        tecnicaDesign: json['TecnicaDesign'],
        filetesLondon: json['FiletesLondon'],
        extraFino: json['ExtraFino'],
        vidroResina: json['VidroResina'],
        porcelana: json['Porcelana'],
        ceramicas: json['Ceramicas'],
        metal: json['Metal'],
        piscinaInterna: json['PiscinaInterna'],
        piscinaBorda: json['PiscinaBorda'],
        piscinaAreaExterna: json['PiscinaAreaExterna'],
        cvEngenharia: json['CvEngenharia'],
        cvRevenda: json['CvRevenda'],
        cvPortobelloShop: json['CvPortobelloShop'],
        cvExportacao: json['CvExportacao'],
        tags: json['Tags'],
        acabamentoDeBorda: json['AcabamentoDeBorda'],
        juntaDeAssentamento: json['JuntaDeAssentamento'],
        grupo: json['Grupo'],
        epu: json['Epu'],
        resistenciaMecanica: json['ResistenciaMecanica'],
        resistenciaAAbrasaoProfunda: json['ResistenciaAAbrasaoProfunda'],
        resAbraSuperficial: json['ResAbraSuperficial'],
        expansaoPorUmidade: double.parse(json['ExpansaoPorUmidade'].toString()),
        cargaRuptura: json['CargaRuptura'],
        agtManchVerdOlLeve: json['AgtManchVerdOlLeve'],
        agtManchVermOlLeve: json['AgtManchVermOlLeve'],
        iodo: json['Iodo'],
        oleo: json['Oleo'],
        absorcaoDagua: double.parse(json['AbsorcaoDagua'].toString()),
        acidoCloridrico3: json['AcidoCloridrico3'],
        acidoCloridrico18: json['AcidoCloridrico18'],
        hidroxidoDePotassio30gl: json['HidroxidoDePotassio30gl'],
        hidroxidoDePotSsio100gl: json['HidroxidoDePotássio100gl'],
        acidoCitrico100gl: json['AcidoCitrico100gl'],
        acidoLatico5: json['AcidoLatico5'],
        gretagemPort: json['GretagemPort'],
        gretagemIng: json['GretagemIng'],
        congelamentoPort: json['CongelamentoPort'],
        congelamentoIng: json['CongelamentoIng'],
        choqueTermicoPort: json['ChoqueTermicoPort'],
        choqueTermicoIng: json['ChoqueTermicoIng'],
        atritoSecoIso: json['AtritoSecoIso'],
        atritoMolhadoIso: double.parse(json['AtritoMolhadoIso'] == null
            ? "0"
            : json['AtritoMolhadoIso'].toString()),
        atritoSecoAstm: json['AtritoSecoAstm'],
        atritoMolhadoAstm: json['AtritoMolhadoAstm'],
        absortancia: json['Absortancia'],
        condTermTabelaco: json['CondTermTabelaco'],
        calorEspTabelaco: json['CalorEspTabelaco'],
        densAparTabelaco: json['DensAparTabelaco'],
        emissivTabelaco: json['EmissivTabelaco'],
        absortanciaTabelaco: json['AbsortanciaTabelaco'],
        transmitTabelaco: json['TransmitTabelaco'],
        coefAlphaTabelaco: json['CoefAlphaTabelaco'],
        coefIlumiTabelaco: json['CoefIlumiTabelaco'],
        impacDuroTabelaco: json['ImpacDuroTabelaco'],
        impacMoleTabelaco: json['ImpacMoleTabelaco'],
        resistUmidTabelaco: json['ResistUmidTabelaco'],
        fv: json['Fv'],
        ranking: json['Ranking'],
        selo: json['Selo'],
        categoriaSite: json['CategoriaSite'],
        rejunte: json['Rejunte'],
        combinaCom: json['CombinaCom'],
        webStatus: json['WebStatus'],
        normativa15463: json['Normativa15463'],
        normativa13818: json['Normativa13818'],
        normativa15575: json['Normativa15575'],
        normativa13006: json['Normativa13006'],
        normativa10545: json['Normativa10545'],
        normativaNa: json['NormativaNa'],
        coefExpansaoTerm: json['CoefExpansaoTerm'],
        numGiros: json['NumGiros'],
        cloretoAmonia100: json['CloretoAmonia100'],
        hipocloritoSod20: json['HipocloritoSod20'],
        ataqueQuiAltaConc: json['AtaqueQuiAltaConc'],
        ataqueQuiBaixaConc: json['AtaqueQuiBaixaConc'],
        indiceRadSolar: json['IndiceRadSolar'],
        refletancia: json['Refletancia'],
        cargaConcentrada: json['CargaConcentrada'],
        ruidoImpacto: json['RuidoImpacto'],
        tipologiaComercial: json['TipologiaComercial'],
        nrFaces: json['NrFaces'],
        atritoPendulo: json['AtritoPendulo'],
        colorBody: json['ColorBody'],
        marca: json['Marca'],
        inventoryItemID: json['InventoryItemID'].toString(),
        deletedMark: json['DeletedMark'],
        indicacoesUso: json['IndicacoesUso'],
        origem: json['Origem'],
        fornecedor: json['Fornecedor'],
        tipologiaCml: json['TipologiaCml'],
        classPortifolio: json['ClassPortifolio'],
        classPortN2: json['ClassPortN2'],
        classPortN3: json['ClassPortN3'],
        classPortN4: json['ClassPortN4'],
        descricaoLonga: json['DescricaoLonga'],
        codAntigo: json['CodAntigo'],
        codPrincipal: json['CodPrincipal'],
        cvPorcelanateria: json['CvPorcelanateria'],
        cvEngVarejo: json['CvEngVarejo'],
        eanCx: json['EanCx'],
        eanPc: json['EanPc'],
        resultadoMinimoManchantes: json['ResultadoMinimoManchantes'].toString(),
        resultadoMinimoLimpeza: json['ResultadoMinimoLimpeza'],
        normativa16928: json['Normativa16928'],
        cvPbAmerica: json['CvPbAmerica'],
        juntaAssentamentoIs: json['JuntaAssentamentoIs'],
        juntaAssentamentoIm: json['JuntaAssentamentoIm'],
        juntaAssentamentoEf: json['JuntaAssentamentoEf'],
        juntaAssentamentoP: json['JuntaAssentamentoP'],
        groupColor: json['GroupColor'],
        zoomImage: json['ZoomImage'],
        enableforrevenda: json['Enableforrevenda'],
        briefing: json['Briefing'],
        simulador: json['Simulador']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Sku'] = '$codProduto$sufixo';
    data['edge_finish'] = caracteristicaAcabamento;
    data['piece_per_box'] = qtPcCaixa.toString();
    data['m2_per_box'] = qtM2Caixa.toString();
    data['type'] = tipologiaComercial;
    data['format'] = descFormatoNominal;
    data['num_faces'] = nrFaces.toString();
    data['Var. de Tonalidade'] = codVariacaoTonalidade;
    data['edge'] = acabamentoDeBorda;
    data['application'] = aplicacaoTecnica;
    data['thickness'] = espessura;
    data['setting_joint'] = juntaDeAssentamento;
    data['reproduction'] = material;
    data['Color Body'] = colorBody;

    return data;
  }

  Map<String, dynamic> toJsonTableProduct() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Absorção de água'] = absorcaoDagua.toString();
    data['Coeficiente de atrito molhado'] = atritoMolhadoIso;
    data['Indicação de Uso'] = uso;
    data['Resistência à Manchas'] = resultadoMinimoLimpeza;
    data['Resistência ao ataque químico de BAIXA concentração'] =
        ataqueQuiBaixaConc;
    data['min_staining_high'] = ataqueQuiAltaConc;
    data['Expansão por umidade'] = expansaoPorUmidade;
    return data;
  }
}
