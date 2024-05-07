// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_key_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationKeyModel _$LocationKeyModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'LocationKeyModel',
      json,
      ($checkedConvert) {
        final val = LocationKeyModel(
          key: $checkedConvert('Key', (v) => v as String),
          localizedName: $checkedConvert('LocalizedName', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'key': 'Key', 'localizedName': 'LocalizedName'},
    );

Map<String, dynamic> _$LocationKeyModelToJson(LocationKeyModel instance) =>
    <String, dynamic>{
      'Key': instance.key,
      'LocalizedName': instance.localizedName,
    };
