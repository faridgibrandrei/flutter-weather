import 'package:whats_the_weather/core/resources/data_state.dart';
import 'package:whats_the_weather/features/weather/data/models/accu/forecast_model.dart';

abstract class ForecastRepository {
  Future<DataState<ForecastModel>> getForecast(String locationKey);
}