import 'dart:developer';

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
      title: "Main",
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
      },
    );
  }
}
