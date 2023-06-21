import 'dart:developer';
import 'dart:io';

import 'package:digital_portobello/src/config/firebase_options.dart';
import 'package:digital_portobello/src/utils/my_http_overrides.dart';
import 'package:digital_portobello/src/utils/timer_inactivity.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'main_app.dart';

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
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MainApp());
}
