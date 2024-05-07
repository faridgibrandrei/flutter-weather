import 'dart:io';

import 'package:dio/dio.dart';
import 'package:whats_the_weather/core/constants/constants.dart';
import 'package:whats_the_weather/core/resources/data_state.dart';
import 'package:whats_the_weather/features/weather/data/data_sources/remote/accu_weather_api_service.dart';
import 'package:whats_the_weather/features/weather/data/models/accu/location_key_model.dart';
import 'package:whats_the_weather/features/weather/domain/repository/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final AccuWeatherApiService _accuWeatherApiService;

  LocationRepositoryImpl(this._accuWeatherApiService);

  @override
  Future<DataState<LocationKeyModel>> getLocationKey(String latlong) async {
    try {
      final httpResponse = await _accuWeatherApiService.getLocationKey(
          apikey: accuWeatherAPIKey,
          latlong: latlong
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(LocationKeyModel.fromJson(httpResponse.response.data));
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