import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:whats_the_weather/features/weather/data/models/accu/unit_model.dart';

part 'speed_model.g.dart';

@JsonSerializable()
class Speed {
  @JsonKey(name: "Metric")
  Unit metric;
  @JsonKey(name: "Imperial")
  Unit imperial;

  Speed({
    required this.metric,
    required this.imperial,
  });

  factory Speed.fromJson(Map<String, dynamic> json) => _$SpeedFromJson(json);

  Map<String, dynamic> toJson() => _$SpeedToJson(this);
}