// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_temperature_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyTemperature _$DailyTemperatureFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DailyTemperature',
      json,
      ($checkedConvert) {
        final val = DailyTemperature(
          minimum: $checkedConvert(
              'Minimum', (v) => Imum.fromJson(v as Map<String, dynamic>)),
          maximum: $checkedConvert(
              'Maximum', (v) => Imum.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {'minimum': 'Minimum', 'maximum': 'Maximum'},
    );

Map<String, dynamic> _$DailyTemperatureToJson(DailyTemperature instance) =>
    <String, dynamic>{
      'Minimum': instance.minimum.toJson(),
      'Maximum': instance.maximum.toJson(),
    };

Imum _$ImumFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Imum',
      json,
      ($checkedConvert) {
        final val = Imum(
          value: $checkedConvert('Value', (v) => (v as num).toDouble()),
          unit: $checkedConvert('Unit', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'value': 'Value', 'unit': 'Unit'},
    );

Map<String, dynamic> _$ImumToJson(Imum instance) => <String, dynamic>{
      'Value': instance.value,
      'Unit': instance.unit,
    };
