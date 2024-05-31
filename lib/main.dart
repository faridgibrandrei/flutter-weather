import 'package:flutter/material.dart';
import 'package:whats_the_weather/config/theme/theme.dart';
import 'package:whats_the_weather/features/weather/presentation/provider/theme_provider.dart';
import 'package:whats_the_weather/features/weather/presentation/provider/favorite_provider.dart';
import 'package:whats_the_weather/features/weather/presentation/pages/home/home_main.dart';
import 'package:whats_the_weather/injection_container.dart';
import 'package:provider/provider.dart';

void main() async {
  await initializeDependencies();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: ChangeNotifierProvider(
        create: (context) => FavoriteProvider(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const HomeMain(),
    );
  }
}