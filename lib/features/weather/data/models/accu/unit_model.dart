import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'unit_model.g.dart';

@JsonSerializable()
class Unit {
  @JsonKey(name: "Value")
  double value;
  @JsonKey(name: "Unit")
  String unit;
  @JsonKey(name: "UnitType")
  int unitType;

  Unit({
    required this.value,
    required this.unit,
    required this.unitType,
  });

  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);

  Map<String, dynamic> toJson() => _$UnitToJson(this);
}
