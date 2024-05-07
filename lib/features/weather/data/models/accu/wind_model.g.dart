// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wind_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wind _$WindFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Wind',
      json,
      ($checkedConvert) {
        final val = Wind(
          speed: $checkedConvert(
              'Speed', (v) => Speed.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {'speed': 'Speed'},
    );

Map<String, dynamic> _$WindToJson(Wind instance) => <String, dynamic>{
      'Speed': instance.speed.toJson(),
    };
