// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Speed _$SpeedFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Speed',
      json,
      ($checkedConvert) {
        final val = Speed(
          metric: $checkedConvert(
              'Metric', (v) => Unit.fromJson(v as Map<String, dynamic>)),
          imperial: $checkedConvert(
              'Imperial', (v) => Unit.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {'metric': 'Metric', 'imperial': 'Imperial'},
    );

Map<String, dynamic> _$SpeedToJson(Speed instance) => <String, dynamic>{
      'Metric': instance.metric.toJson(),
      'Imperial': instance.imperial.toJson(),
    };
