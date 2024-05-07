import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:whats_the_weather/features/weather/data/models/accu/unit_model.dart';

part 'temperature_model.g.dart';

@JsonSerializable()
class Temperature {
  @JsonKey(name: "Metric")
  Unit metric;
  @JsonKey(name: "Imperial")
  Unit imperial;

  Temperature({
    required this.metric,
    required this.imperial,
  });

  factory Temperature.fromJson(Map<String, dynamic> json) => _$TemperatureFromJson(json);

  Map<String, dynamic> toJson() => _$TemperatureToJson(this);
}