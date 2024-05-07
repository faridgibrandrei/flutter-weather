import 'package:json_annotation/json_annotation.dart';
import 'package:whats_the_weather/features/weather/data/models/accu/speed_model.dart';
import 'dart:convert';

import 'package:whats_the_weather/features/weather/data/models/accu/temperature_model.dart';

part 'wind_model.g.dart';

@JsonSerializable()
class Wind {
  @JsonKey(name: "Speed")
  Speed speed;

  Wind({
    required this.speed,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);

  Map<String, dynamic> toJson() => _$WindToJson(this);
}