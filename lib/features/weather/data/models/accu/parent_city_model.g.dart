// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parent_city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParentCity _$ParentCityFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ParentCity',
      json,
      ($checkedConvert) {
        final val = ParentCity(
          key: $checkedConvert('Key', (v) => v as String),
          localizedName: $checkedConvert('LocalizedName', (v) => v as String),
          englishName: $checkedConvert('EnglishName', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'key': 'Key',
        'localizedName': 'LocalizedName',
        'englishName': 'EnglishName'
      },
    );

Map<String, dynamic> _$ParentCityToJson(ParentCity instance) =>
    <String, dynamic>{
      'Key': instance.key,
      'LocalizedName': instance.localizedName,
      'EnglishName': instance.englishName,
    };
