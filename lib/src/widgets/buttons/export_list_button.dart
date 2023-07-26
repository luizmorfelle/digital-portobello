import 'package:digital_portobello/src/utils/target.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/product_model.dart';
import '../../models/space_n1_model.dart';
import '../../utils/constants.dart';
import '../../utils/translate.dart';
import '../dialogs/dialog_qrcode.dart';

class ExportListButton extends StatelessWidget {
  const ExportListButton({
    super.key,
    required this.products,
    required this.urlBase,
  });

  final Map<ProductModel, SpaceN1Model?> products;
  final String urlBase;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        String url = '';

        products.forEach((product, space) {
          if (url.isNotEmpty) url += ',';

          url += space != null
              ? '${product.codProduto}${product.sufixo}-${space.id}-${surfaces.firstWhere((it) => it.id == space.superficiesID.toString()).value}_${space.title}_${space.spaceModel!.title}'
              : '${product.codProduto}${product.sufixo}';
        });
        if (isWeb()) {
          launchUrl(Uri.parse("$urlBase$url"));
          return;
        }
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return DialogQrCode(urlBase: urlBase, url: url);
            });
      },
      icon: const Icon(Icons.qr_code),
      label: Text(tl('export_list', context)),
    );
  }
}
