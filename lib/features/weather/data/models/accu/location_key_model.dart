import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import 'package:whats_the_weather/features/weather/data/models/accu/parent_city_model.dart';

part 'location_key_model.g.dart';

LocationKeyModel locationKeyModelFromJson(String str) => LocationKeyModel.fromJson(json.decode(str));

String locationKeyModelToJson(LocationKeyModel data) => json.encode(data.toJson());

@JsonSerializable()
class LocationKeyModel {
  @JsonKey(name: "Key")
  String key;
  @JsonKey(name: "LocalizedName")
  String localizedName;

  LocationKeyModel({
    required this.key,
    required this.localizedName,
  });

  factory LocationKeyModel.fromJson(Map<String, dynamic> json) => _$LocationKeyModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationKeyModelToJson(this);
}