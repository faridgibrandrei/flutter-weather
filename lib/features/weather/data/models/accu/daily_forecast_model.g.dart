// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_forecast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyForecast _$DailyForecastFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DailyForecast',
      json,
      ($checkedConvert) {
        final val = DailyForecast(
          date: $checkedConvert('Date', (v) => DateTime.parse(v as String)),
          epochDate: $checkedConvert('EpochDate', (v) => (v as num).toInt()),
          temperature: $checkedConvert('Temperature',
              (v) => DailyTemperature.fromJson(v as Map<String, dynamic>)),
          day: $checkedConvert(
              'Day', (v) => Day.fromJson(v as Map<String, dynamic>)),
          night: $checkedConvert(
              'Night', (v) => Day.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {
        'date': 'Date',
        'epochDate': 'EpochDate',
        'temperature': 'Temperature',
        'day': 'Day',
        'night': 'Night'
      },
    );

Map<String, dynamic> _$DailyForecastToJson(DailyForecast instance) =>
    <String, dynamic>{
      'Date': instance.date.toIso8601String(),
      'EpochDate': instance.epochDate,
      'Temperature': instance.temperature.toJson(),
      'Day': instance.day.toJson(),
      'Night': instance.night.toJson(),
    };
