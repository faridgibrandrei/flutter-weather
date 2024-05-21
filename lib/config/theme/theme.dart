import 'package:flutter/material.dart';
import 'package:whats_the_weather/core/constants/constants.dart';

// Light Theme
final ThemeData lightMode = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0XffDCECFA),
    titleTextStyle: TextStyle(
      fontFamily: fontFam,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Color(0Xff342563),
    ),
  ),
  colorScheme: const ColorScheme.light(
    background: Color(0XffDCECFA),
    primary: Color(0xffEBF4F9),
    secondary: Color(0xffA8B7CC),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: fontFam,
      fontSize: 64,
      fontWeight: FontWeight.bold,
      color: Color(0Xff342563),
    ),
    displayMedium: TextStyle(
      fontFamily: fontFam,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Color(0Xff342563),
    ),
    displaySmall: TextStyle(
      fontFamily: fontFam,
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Color(0Xff342563),
    ),
    titleLarge: TextStyle(
      fontFamily: fontFam,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Color(0Xff342563),
    ),
  ),
);

// Dark Theme
final ThemeData darkMode = ThemeData(
  primarySwatch: Colors.indigo,
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0Xff342563),
    titleTextStyle: TextStyle(
      fontFamily: fontFam,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Color(0XffFFFFFF),
    ),
  ),
  colorScheme: const ColorScheme.dark(
    background: Color(0Xff342563),
    primary: Color(0xff4A3B7A),
    secondary: Color(0xffA8B7CC),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: fontFam,
      fontSize: 64,
      fontWeight: FontWeight.bold,
      color: Color(0XffFFFFFF),
    ),
    displayMedium: TextStyle(
      fontFamily: fontFam,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Color(0XffFFFFFF),
    ),
    displaySmall: TextStyle(
      fontFamily: fontFam,
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Color(0XffFFFFFF),
    ),
    titleLarge: TextStyle(
      fontFamily: fontFam,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Color(0XffFFFFFF),
    ),
  ),
);