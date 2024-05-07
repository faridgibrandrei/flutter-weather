import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:whats_the_weather/features/weather/data/models/accu/temperature_model.dart';
import 'package:whats_the_weather/features/weather/data/models/accu/wind_model.dart';

part 'current_weather_model.g.dart';

List<CurrentWeatherModel> currentWeatherModelFromJson(String str) => List<CurrentWeatherModel>.from(json.decode(str).map((x) => CurrentWeatherModel.fromJson(x)));

String currentWeatherModelToJson(List<CurrentWeatherModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class CurrentWeatherModel {
  @JsonKey(name: "EpochTime")
  int epochTime;
  @JsonKey(name: "WeatherText")
  String weatherText;
  @JsonKey(name: "WeatherIcon")
  int weatherIcon;
  @JsonKey(name: "IsDayTime")
  bool isDayTime;
  @JsonKey(name: "Temperature")
  Temperature temperature;
  @JsonKey(name: "RelativeHumidity")
  int relativeHumidity;
  @JsonKey(name: "Wind")
  Wind wind;
  @JsonKey(name: "UVIndex")
  int uvIndex;
  @JsonKey(name: "UVIndexText")
  String uvIndexText;

  CurrentWeatherModel({
    required this.epochTime,
    required this.weatherText,
    required this.weatherIcon,
    required this.isDayTime,
    required this.temperature,
    required this.relativeHumidity,
    required this.wind,
    required this.uvIndex,
    required this.uvIndexText,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) => _$CurrentWeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherModelToJson(this);
}