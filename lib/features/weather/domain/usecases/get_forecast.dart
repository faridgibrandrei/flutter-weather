import 'package:whats_the_weather/core/resources/data_state.dart';
import 'package:whats_the_weather/features/weather/data/models/accu/forecast_model.dart';
import 'package:whats_the_weather/features/weather/domain/repository/forecast_repository.dart';

class GetForecastUseCase {

  final ForecastRepository _forecastRepository;

  GetForecastUseCase(this._forecastRepository);
  @override

  Future<DataState<ForecastModel>> call(String locationKey) {
    return _forecastRepository.getForecast(locationKey);
  }

}