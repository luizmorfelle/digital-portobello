import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/translate.dart';

class DialogProductSimulate extends StatelessWidget {
  const DialogProductSimulate({
    required this.urlQrCode,
    super.key,
  });

  final String urlQrCode;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(tl('recieve_list', context)),
      content: InkWell(
        onTap: () async => await launchUrl(Uri.parse(urlQrCode)),
        child: SizedBox(
          height: 400,
          width: 400,
          child: QrImageView(
            data: urlQrCode,
            version: QrVersions.auto,
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(tl('close', context)),
        ),
      ],
    );
  }
}
