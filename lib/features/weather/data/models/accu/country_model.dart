import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'country_model.g.dart';

@JsonSerializable()
class Country {
  @JsonKey(name: "ID")
  String id;
  @JsonKey(name: "LocalizedName")
  String localizedName;

  Country({
    required this.id,
    required this.localizedName,
  });

  factory Country.fromJson(Map<String, dynamic> json) => _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}
