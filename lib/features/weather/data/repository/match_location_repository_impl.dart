import 'dart:io';

import 'package:dio/dio.dart';
import 'package:whats_the_weather/core/constants/constants.dart';
import 'package:whats_the_weather/core/resources/data_state.dart';
import 'package:whats_the_weather/features/weather/data/data_sources/remote/accu_weather_api_service.dart';
import 'package:whats_the_weather/features/weather/data/models/accu/match_location_model.dart';
import 'package:whats_the_weather/features/weather/domain/repository/match_location_repository.dart';

class MatchLocationRepositoryImpl implements MatchLocationRepository {
  final AccuWeatherApiService _accuWeatherApiService;

  MatchLocationRepositoryImpl(this._accuWeatherApiService);

  @override
  Future<DataState<List<MatchLocationModel>>> getMatchLocation(String query) async {
    try {
      final httpResponse = await _accuWeatherApiService.getMatchLocation(
          apikey: accuWeatherAPIKey,
          query: query
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final List<dynamic> responseData = httpResponse.response.data;
        final List<MatchLocationModel> matchLocations = responseData
            .map((json) => MatchLocationModel.fromJson(json))
            .toList();
        return DataSuccess(matchLocations);
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