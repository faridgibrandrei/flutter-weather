import 'package:whats_the_weather/core/resources/data_state.dart';
import 'package:whats_the_weather/features/weather/data/models/accu/current_weather_model.dart';
import 'package:whats_the_weather/features/weather/domain/repository/accu_weather_repository.dart';

class GetACCUWeathersUseCase {

  final ACCUWeatherRepository _accuWeatherRepository;

  GetACCUWeathersUseCase(this._accuWeatherRepository);
  @override

  Future<DataState<CurrentWeatherModel>> call(String locationKey) {
    return _accuWeatherRepository.getCurrentWeather(locationKey);
  }

}