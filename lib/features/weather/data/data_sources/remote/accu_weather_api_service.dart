import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:whats_the_weather/core/constants/constants.dart';
import 'package:whats_the_weather/features/weather/data/models/accu/current_weather_model.dart';
import 'package:whats_the_weather/features/weather/data/models/accu/forecast_model.dart';
import 'package:whats_the_weather/features/weather/data/models/accu/location_key_model.dart';
import 'package:whats_the_weather/features/weather/data/models/accu/match_location_model.dart';

part 'accu_weather_api_service.g.dart';

@RestApi(baseUrl: accuWeatherAPIBaseURL)
abstract class AccuWeatherApiService {
  factory AccuWeatherApiService(Dio dio) = _AccuWeatherApiService;

  @GET('locations/v1/cities/geoposition/search?')
  Future<HttpResponse<LocationKeyModel>> getLocationKey({
    @Query("apikey") String ? apikey,
    @Query("q") String ? latlong,
  });

  @GET('currentconditions/v1/{locationKey}?details=true')
  Future<HttpResponse<List<CurrentWeatherModel>>> getCurrentWeather({
    @Path("locationKey") String ? locationKey,
    @Query("apikey") String ? apikey,
  });

  @GET('forecasts/v1/daily/5day/{locationKey}?metric=true')
  Future<HttpResponse<ForecastModel>> getForecast({
    @Path("locationKey") String ? locationKey,
    @Query("apikey") String ? apikey,
  });

  @GET('locations/v1/cities/autocomplete?')
  Future<HttpResponse<List<MatchLocationModel>>> getMatchLocation({
    @Query("apikey") String ? apikey,
    @Query("q") String ? query,
  });
}