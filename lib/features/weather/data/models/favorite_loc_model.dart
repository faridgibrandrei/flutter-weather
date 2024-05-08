import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'favorite_loc_model.g.dart';

@JsonSerializable()
class FavoriteLoc {
  @JsonKey(name: "key")
  String key;
  @JsonKey(name: "LocalizedName")
  String localizedName;

  FavoriteLoc({
    required this.key,
    required this.localizedName,
  });

  factory FavoriteLoc.fromJson(Map<String, dynamic> json) => _$FavoriteLocFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteLocToJson(this);
}
