// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherModel _$CurrentWeatherModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CurrentWeatherModel',
      json,
      ($checkedConvert) {
        final val = CurrentWeatherModel(
          epochTime: $checkedConvert('EpochTime', (v) => (v as num).toInt()),
          weatherText: $checkedConvert('WeatherText', (v) => v as String),
          weatherIcon:
              $checkedConvert('WeatherIcon', (v) => (v as num).toInt()),
          isDayTime: $checkedConvert('IsDayTime', (v) => v as bool),
          temperature: $checkedConvert('Temperature',
              (v) => Temperature.fromJson(v as Map<String, dynamic>)),
          relativeHumidity:
              $checkedConvert('RelativeHumidity', (v) => (v as num).toInt()),
          wind: $checkedConvert(
              'Wind', (v) => Wind.fromJson(v as Map<String, dynamic>)),
          uvIndex: $checkedConvert('UVIndex', (v) => (v as num).toInt()),
          uvIndexText: $checkedConvert('UVIndexText', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'epochTime': 'EpochTime',
        'weatherText': 'WeatherText',
        'weatherIcon': 'WeatherIcon',
        'isDayTime': 'IsDayTime',
        'temperature': 'Temperature',
        'relativeHumidity': 'RelativeHumidity',
        'wind': 'Wind',
        'uvIndex': 'UVIndex',
        'uvIndexText': 'UVIndexText'
      },
    );

Map<String, dynamic> _$CurrentWeatherModelToJson(
        CurrentWeatherModel instance) =>
    <String, dynamic>{
      'EpochTime': instance.epochTime,
      'WeatherText': instance.weatherText,
      'WeatherIcon': instance.weatherIcon,
      'IsDayTime': instance.isDayTime,
      'Temperature': instance.temperature.toJson(),
      'RelativeHumidity': instance.relativeHumidity,
      'Wind': instance.wind.toJson(),
      'UVIndex': instance.uvIndex,
      'UVIndexText': instance.uvIndexText,
    };
