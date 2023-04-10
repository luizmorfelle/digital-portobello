import 'dart:developer';

import 'package:digital_portobello/src/pages/enviroment_page.dart';
import 'package:digital_portobello/src/pages/home_page.dart';
import 'package:digital_portobello/src/config/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  init();
}

Future<void> init() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (error) {
    log('Firebase não pode ser inicado!');
  }

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital',
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
          fontFamily: 'Helvetica',
          textTheme: Theme.of(context).textTheme.copyWith(
              headlineLarge: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold))),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/enviroment': (context) => const EnviromentPage()
      },
    );
  }
}
