import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:whats_the_weather/features/weather/data/models/favorite_loc_model.dart';

class PrefHelper {
  //Key
  static const String temperatureState = "temperatureState";


  //Method
  static Future<void> saveIntValue(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  static Future<int?> getIntValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getInt(key) == null) {
      return 0;
    }
    return prefs.getInt(key);
  }

  Future<void> saveFaveLoc(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String?> getFaveLocPreference(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<void> saveFavoriteLocation(FavoriteLoc favoriteLoc) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(favoriteLoc.toJson());
    prefs.setString('favorite_loc', jsonString);
  }

  static Future<FavoriteLoc?> getFavoriteLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('favorite_loc');
    if (jsonString != null) {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return FavoriteLoc.fromJson(jsonMap);
    }
  }


}