// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastModel _$ForecastModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ForecastModel',
      json,
      ($checkedConvert) {
        final val = ForecastModel(
          dailyForecasts: $checkedConvert(
              'DailyForecasts',
              (v) => (v as List<dynamic>)
                  .map((e) => DailyForecast.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {'dailyForecasts': 'DailyForecasts'},
    );

Map<String, dynamic> _$ForecastModelToJson(ForecastModel instance) =>
    <String, dynamic>{
      'DailyForecasts': instance.dailyForecasts.map((e) => e.toJson()).toList(),
    };
