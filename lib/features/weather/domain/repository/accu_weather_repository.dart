import 'package:whats_the_weather/features/weather/data/models/accu/current_weather_model.dart';
import 'package:whats_the_weather/core/resources/data_state.dart';

abstract class ACCUWeatherRepository {
  Future<DataState<CurrentWeatherModel>> getCurrentWeather(String locationKey);
}