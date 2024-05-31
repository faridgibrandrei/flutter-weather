import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'last_current_weather.g.dart';

@JsonSerializable()
class LastCurrentWeather {
  final String locationKey;
  final String locationName;
  final int currentTemp;
  final String currentCondition;
  final int currentHumidity;
  final double currentWind;

  LastCurrentWeather({
    required this.locationKey,
    required this.locationName,
    required this.currentTemp,
    required this.currentCondition,
    required this.currentHumidity,
    required this.currentWind,
  });

  factory LastCurrentWeather.fromJson(Map<String, dynamic> json) => _$LastCurrentWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$LastCurrentWeatherToJson(this);
}