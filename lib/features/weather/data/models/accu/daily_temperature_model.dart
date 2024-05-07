import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'daily_temperature_model.g.dart';

@JsonSerializable()
class DailyTemperature {
  @JsonKey(name: "Minimum")
  Imum minimum;
  @JsonKey(name: "Maximum")
  Imum maximum;

  DailyTemperature({
    required this.minimum,
    required this.maximum,
  });

  factory DailyTemperature.fromJson(Map<String, dynamic> json) => _$DailyTemperatureFromJson(json);

  Map<String, dynamic> toJson() => _$DailyTemperatureToJson(this);
}

@JsonSerializable()
class Imum {
  @JsonKey(name: "Value")
  double value;
  @JsonKey(name: "Unit")
  String unit;

  Imum({
    required this.value,
    required this.unit,
  });

  factory Imum.fromJson(Map<String, dynamic> json) => _$ImumFromJson(json);

  Map<String, dynamic> toJson() => _$ImumToJson(this);
}