// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_loc_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteLoc _$FavoriteLocFromJson(Map<String, dynamic> json) => $checkedCreate(
      'FavoriteLoc',
      json,
      ($checkedConvert) {
        final val = FavoriteLoc(
          key: $checkedConvert('key', (v) => v as String),
          localizedName: $checkedConvert('LocalizedName', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'localizedName': 'LocalizedName'},
    );

Map<String, dynamic> _$FavoriteLocToJson(FavoriteLoc instance) =>
    <String, dynamic>{
      'key': instance.key,
      'LocalizedName': instance.localizedName,
    };
