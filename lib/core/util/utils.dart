import 'package:flutter/cupertino.dart';

class Utils {
  static bool isDarkMode(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.dark;
  }
}