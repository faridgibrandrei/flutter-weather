import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whats_the_weather/core/util/pref_helper.dart';

class Utils {
  static bool isDarkMode(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.dark;
  }

  static Future<bool> isFahrenheit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getInt(PrefHelper.temperatureState) == null) {
      return false;
    } else {
      return prefs.getInt(PrefHelper.temperatureState) == 1;
    }
  }

  static int celsiusToFahrenheit(int celsius) {
    double fahrenheit = (celsius * 9 / 5) + 32;
    return fahrenheit.round();
  }
}