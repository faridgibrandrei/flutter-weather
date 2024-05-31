import 'package:flutter/material.dart';
import 'package:whats_the_weather/core/util/sql_helper.dart';

class FavoriteProvider with ChangeNotifier {
  String? _locationName;
  String? _locationKey;
  bool _isFavorite = false;

  String? get locationName => _locationName;
  String? get locationKey => _locationKey;
  bool get isFavorite => _isFavorite;

  Future<void> setLocationAndCheckFavorite(String locationName, String locationKey) async {
    _locationName = locationName;
    _locationKey = locationKey;
    await _updateFavoriteStatus();
  }

  // Method to update favorite status from database
  Future<void> _updateFavoriteStatus() async {
    if (_locationName != null) {
      _isFavorite = await SQLHelper.isExist(_locationName!);

      if (_isFavorite) {
        SQLHelper.deleteItem(_locationName!);
      } else {
        SQLHelper.createItem(_locationName!, _locationKey!);
      }

      _isFavorite = !_isFavorite;
      notifyListeners();
    }
  }

}