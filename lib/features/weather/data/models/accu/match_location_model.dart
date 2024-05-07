import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:whats_the_weather/features/weather/data/models/accu/country_model.dart';

part 'match_location_model.g.dart';

List<MatchLocationModel> matchLocationModelFromJson(String str) => List<MatchLocationModel>.from(json.decode(str).map((x) => MatchLocationModel.fromJson(x)));

String matchLocationModelToJson(List<MatchLocationModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class MatchLocationModel {
  @JsonKey(name: "Key")
  String key;
  @JsonKey(name: "LocalizedName")
  String localizedName;
  @JsonKey(name: "Country")
  Country country;

  MatchLocationModel({
    required this.key,
    required this.localizedName,
    required this.country,
  });

  factory MatchLocationModel.fromJson(Map<String, dynamic> json) => _$MatchLocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$MatchLocationModelToJson(this);
}