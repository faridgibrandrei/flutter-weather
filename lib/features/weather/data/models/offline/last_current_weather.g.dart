// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_current_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LastCurrentWeather _$LastCurrentWeatherFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'LastCurrentWeather',
      json,
      ($checkedConvert) {
        final val = LastCurrentWeather(
          locationKey: $checkedConvert('location_key', (v) => v as String),
          locationName: $checkedConvert('location_name', (v) => v as String),
          currentTemp:
              $checkedConvert('current_temp', (v) => (v as num).toInt()),
          currentCondition:
              $checkedConvert('current_condition', (v) => v as String),
          currentHumidity:
              $checkedConvert('current_humidity', (v) => (v as num).toInt()),
          currentWind:
              $checkedConvert('current_wind', (v) => (v as num).toDouble()),
        );
        return val;
      },
      fieldKeyMap: const {
        'locationKey': 'location_key',
        'locationName': 'location_name',
        'currentTemp': 'current_temp',
        'currentCondition': 'current_condition',
        'currentHumidity': 'current_humidity',
        'currentWind': 'current_wind'
      },
    );

Map<String, dynamic> _$LastCurrentWeatherToJson(LastCurrentWeather instance) =>
    <String, dynamic>{
      'location_key': instance.locationKey,
      'location_name': instance.locationName,
      'current_temp': instance.currentTemp,
      'current_condition': instance.currentCondition,
      'current_humidity': instance.currentHumidity,
      'current_wind': instance.currentWind,
    };
