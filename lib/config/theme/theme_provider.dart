import 'package:flutter/material.dart';
import 'theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme(int mode) {
    if (mode == 0) {
      themeData = lightMode;
    } else if (mode == 1) {
      themeData = darkMode;
    }

    // if (_themeData == lightMode) {
    //   themeData = darkMode;
    // } else {
    //   themeData = lightMode;
    // }
  }
}