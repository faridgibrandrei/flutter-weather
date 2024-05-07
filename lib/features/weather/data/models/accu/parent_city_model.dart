import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'parent_city_model.g.dart';

@JsonSerializable()
class ParentCity {
  @JsonKey(name: "Key")
  String key;
  @JsonKey(name: "LocalizedName")
  String localizedName;
  @JsonKey(name: "EnglishName")
  String englishName;

  ParentCity({
    required this.key,
    required this.localizedName,
    required this.englishName,
  });

  factory ParentCity.fromJson(Map<String, dynamic> json) => _$ParentCityFromJson(json);

  Map<String, dynamic> toJson() => _$ParentCityToJson(this);
}