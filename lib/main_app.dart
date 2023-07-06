import 'package:digital_portobello/src/providers/favorite_provider.dart';
import 'package:digital_portobello/src/providers/language_provider.dart';
import 'package:digital_portobello/src/providers/sales_channel_provider.dart';
import 'package:digital_portobello/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
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
            primary: Colors.black,
            secondary: Colors.black, // Your accent color
          ),
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
              titleLarge: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 24),
              titleMedium: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
              bodyLarge: const TextStyle(color: Colors.black, fontSize: 19),
              headlineLarge: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
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
