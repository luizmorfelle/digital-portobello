import 'package:digital_portobello/src/l10n/l10n.dart';
import 'package:digital_portobello/src/providers/language_provider.dart';
import 'package:digital_portobello/src/routes/routes.dart';
import 'package:digital_portobello/src/providers/favorite_provider.dart';
import 'package:digital_portobello/src/providers/sales_channel_provider.dart';
import 'package:digital_portobello/src/utils/timer_inactivity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: FavoriteProvider()),
        ChangeNotifierProvider.value(value: SalesChannelProvider()),
        ChangeNotifierProvider.value(value: LanguageProvider()),
      ],
      child: MaterialApp.router(
        title: 'Digital',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.white,
            secondary: Colors.black, // Your accent color
          ),
          tabBarTheme: TabBarTheme(),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(100, 50),
              side: const BorderSide(color: Colors.black, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
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
