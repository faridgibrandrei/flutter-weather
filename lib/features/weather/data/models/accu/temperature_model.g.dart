// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperature_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Temperature _$TemperatureFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Temperature',
      json,
      ($checkedConvert) {
        final val = Temperature(
          metric: $checkedConvert(
              'Metric', (v) => Unit.fromJson(v as Map<String, dynamic>)),
          imperial: $checkedConvert(
              'Imperial', (v) => Unit.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {'metric': 'Metric', 'imperial': 'Imperial'},
    );

Map<String, dynamic> _$TemperatureToJson(Temperature instance) =>
    <String, dynamic>{
      'Metric': instance.metric.toJson(),
      'Imperial': instance.imperial.toJson(),
    };
