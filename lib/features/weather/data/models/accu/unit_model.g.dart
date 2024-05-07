// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Unit _$UnitFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Unit',
      json,
      ($checkedConvert) {
        final val = Unit(
          value: $checkedConvert('Value', (v) => (v as num).toDouble()),
          unit: $checkedConvert('Unit', (v) => v as String),
          unitType: $checkedConvert('UnitType', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {
        'value': 'Value',
        'unit': 'Unit',
        'unitType': 'UnitType'
      },
    );

Map<String, dynamic> _$UnitToJson(Unit instance) => <String, dynamic>{
      'Value': instance.value,
      'Unit': instance.unit,
      'UnitType': instance.unitType,
    };
