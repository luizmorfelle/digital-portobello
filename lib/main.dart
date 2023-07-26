import 'dart:developer';
import 'dart:io';

import 'package:digital_portobello/src/api/api.dart';
import 'package:digital_portobello/src/config/firebase_options.dart';
import 'package:digital_portobello/src/utils/my_http_overrides.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'main_app.dart';

void main() {
  init();
}

String id = '100';

Future<void> init() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (error) {
    log('Firebase não pode ser inicado!');
  }

  await dotenv.load(fileName: "assets/.env");
  // await WindowManager.instance.setFullScreen(true);
  try {
    id = await rootBundle.loadString('assets/id.txt');
  } catch (e) {
    log('Erro ao carregar id.txt');
  }
  try {
    await refreshToken();
  } catch (e) {
    log('Erro ao dar refreshToken');
  }

  HttpOverrides.global = MyHttpOverrides();
  runApp(const MainApp());
  // runApp(MaterialApp(
  //   home: Scaffold(
  //     backgroundColor: Colors.white,
  //     body: Center(
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Text(
  //             'EM MANUTENÇÃO',
  //             style: TextStyle(
  //               fontSize: 45,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //           SizedBox(
  //             width: 15,
  //           ),
  //           Icon(
  //             Icons.construction,
  //             color: Colors.black,
  //             size: 100,
  //           )
  //         ],
  //       ),
  //     ),
  //   ),
  // ));
}
