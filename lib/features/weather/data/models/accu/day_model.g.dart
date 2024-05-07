// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Day _$DayFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Day',
      json,
      ($checkedConvert) {
        final val = Day(
          icon: $checkedConvert('Icon', (v) => (v as num).toInt()),
          iconPhrase: $checkedConvert('IconPhrase', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'icon': 'Icon', 'iconPhrase': 'IconPhrase'},
    );

Map<String, dynamic> _$DayToJson(Day instance) => <String, dynamic>{
      'Icon': instance.icon,
      'IconPhrase': instance.iconPhrase,
    };
