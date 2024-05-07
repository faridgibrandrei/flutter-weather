import 'package:flutter/material.dart';
import 'package:whats_the_weather/config/theme/app_themes.dart';
import 'package:whats_the_weather/features/weather/presentation/pages/home/home_main.dart';
import 'package:whats_the_weather/injection_container.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: const HomeMain(),
    );
  }
}