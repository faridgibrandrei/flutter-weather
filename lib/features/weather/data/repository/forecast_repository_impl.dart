import 'dart:io';

import 'package:dio/dio.dart';
import 'package:whats_the_weather/core/constants/constants.dart';
import 'package:whats_the_weather/core/resources/data_state.dart';
import 'package:whats_the_weather/features/weather/data/data_sources/remote/accu_weather_api_service.dart';
import 'package:whats_the_weather/features/weather/data/models/accu/forecast_model.dart';
import 'package:whats_the_weather/features/weather/domain/repository/forecast_repository.dart';

class ForecastRepositoryImpl implements ForecastRepository {
  final AccuWeatherApiService _accuWeatherApiService;

  ForecastRepositoryImpl(this._accuWeatherApiService);

  @override
  Future<DataState<ForecastModel>> getForecast(String locationKey) async {
    try {
      final httpResponse = await _accuWeatherApiService.getForecast(
          apikey: accuWeatherAPIKey,
          locationKey: locationKey
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(ForecastModel.fromJson(httpResponse.response.data));
      } else {
        return DataFailed(
            DioError(
                error: httpResponse.response.statusMessage,
                response: httpResponse.response,
                type: DioErrorType.response,
                requestOptions: httpResponse.response.requestOptions
            )
        );
      }
    } on DioError catch(e){
      return DataFailed(e);
    }
  }

}