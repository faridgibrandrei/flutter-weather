import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:whats_the_weather/features/weather/data/models/accu/daily_temperature_model.dart';
import 'package:whats_the_weather/features/weather/data/models/accu/day_model.dart';

part 'daily_forecast_model.g.dart';

@JsonSerializable()
class DailyForecast {
  @JsonKey(name: "Date")
  DateTime date;
  @JsonKey(name: "EpochDate")
  int epochDate;
  @JsonKey(name: "Temperature")
  DailyTemperature temperature;
  @JsonKey(name: "Day")
  Day day;
  @JsonKey(name: "Night")
  Day night;

  DailyForecast({
    required this.date,
    required this.epochDate,
    required this.temperature,
    required this.day,
    required this.night,
  });

  factory DailyForecast.fromJson(Map<String, dynamic> json) => _$DailyForecastFromJson(json);

  Map<String, dynamic> toJson() => _$DailyForecastToJson(this);
}