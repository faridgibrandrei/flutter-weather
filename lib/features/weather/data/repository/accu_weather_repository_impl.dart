import 'dart:io';
import 'package:whats_the_weather/core/constants/constants.dart';
import 'package:whats_the_weather/core/resources/data_state.dart';
import 'package:whats_the_weather/features/weather/data/data_sources/remote/accu_weather_api_service.dart';
import 'package:whats_the_weather/features/weather/data/models/accu/current_weather_model.dart';
import 'package:whats_the_weather/features/weather/domain/repository/accu_weather_repository.dart';
import 'package:dio/dio.dart';

class ACCUWeatherRepositoryImpl implements ACCUWeatherRepository {
  final AccuWeatherApiService _accuWeatherApiService;

  ACCUWeatherRepositoryImpl(this._accuWeatherApiService);

  @override
  Future<DataState<CurrentWeatherModel>> getCurrentWeather(String locationKey) async {
    try {
      final httpResponse = await _accuWeatherApiService.getCurrentWeather(
          apikey: accuWeatherAPIKey,
          locationKey: locationKey
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final List<dynamic> responseData = httpResponse.response.data;
        if (responseData.isNotEmpty) {
          return DataSuccess(CurrentWeatherModel.fromJson(responseData.first));
        } else {
          // Handle case where the list is empty
          return DataFailed(
              DioError(
                  error: 'Empty response',
                  response: httpResponse.response,
                  type: DioErrorType.response,
                  requestOptions: httpResponse.response.requestOptions
              )
          );
        }
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