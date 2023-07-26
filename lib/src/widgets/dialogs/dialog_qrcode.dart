import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/translate.dart';

class DialogQrCode extends StatelessWidget {
  const DialogQrCode({
    super.key,
    required this.urlBase,
    required this.url,
  });

  final String urlBase;
  final String url;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(tl('recieve_list', context)),
      content: InkWell(
        onTap: () async => await launchUrl(Uri.parse("$urlBase$url")),
        child: SizedBox(
          height: 400,
          width: 400,
          child: QrImageView(
            data: '$urlBase$url',
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
