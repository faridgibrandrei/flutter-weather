import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:whats_the_weather/features/weather/data/models/accu/daily_forecast_model.dart';

part 'forecast_model.g.dart';

ForecastModel forecastModelFromJson(String str) => ForecastModel.fromJson(json.decode(str));

String forecastModelToJson(ForecastModel data) => json.encode(data.toJson());

@JsonSerializable()
class ForecastModel {
  @JsonKey(name: "DailyForecasts")
  List<DailyForecast> dailyForecasts;

  ForecastModel({
    required this.dailyForecasts,
  });

  factory ForecastModel.fromJson(Map<String, dynamic> json) => _$ForecastModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastModelToJson(this);
}