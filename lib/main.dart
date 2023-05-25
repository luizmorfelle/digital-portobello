import 'dart:developer';

import 'package:digital_portobello/routes.dart';
import 'package:digital_portobello/src/config/firebase_options.dart';
import 'package:digital_portobello/src/providers/favorite_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: FavoriteProvider()),
      ],
      child: MaterialApp.router(
        title: 'Digital',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.black,
            secondary: Colors.black, // Your accent color
          ),
          fontFamily: 'Helvetica',
          textTheme: Theme.of(context).textTheme.copyWith(
              headlineLarge: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
              headlineMedium: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              displaySmall: const TextStyle(color: Colors.black, fontSize: 19)),
        ),
        routerConfig: routes,
      ),
    );
  }
}
