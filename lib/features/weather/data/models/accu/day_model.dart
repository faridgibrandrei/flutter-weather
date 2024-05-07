import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'day_model.g.dart';

@JsonSerializable()
class Day {
  @JsonKey(name: "Icon")
  int icon;
  @JsonKey(name: "IconPhrase")
  String iconPhrase;

  Day({
    required this.icon,
    required this.iconPhrase,
  });

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  Map<String, dynamic> toJson() => _$DayToJson(this);
}