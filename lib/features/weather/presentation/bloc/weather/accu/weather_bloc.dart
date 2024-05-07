import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_the_weather/core/resources/data_state.dart';
import 'package:whats_the_weather/features/weather/domain/usecases/get_accu_weather.dart';
import 'package:whats_the_weather/features/weather/presentation/bloc/weather/accu/weather_event.dart';
import 'package:whats_the_weather/features/weather/presentation/bloc/weather/accu/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  final GetACCUWeathersUseCase _getACCUWeatherUseCase;

  WeatherBloc(this._getACCUWeatherUseCase) : super(const WeatherLoading()) {
    on <GetCurrentWeather> (onGetCurrentTheWeather);
  }

  void onGetCurrentTheWeather(GetCurrentWeather event, Emitter<WeatherState> emit) async {
    final dataState = await _getACCUWeatherUseCase(event.locationKey);

    if(dataState is DataSuccess && dataState.data != null) {
      emit(
          WeatherDone(dataState.data!)
      );
    }

    if(dataState is DataFailed) {
      print(dataState.error!.message);
      emit(
          WeatherError(dataState.error!)
      );
    }
  }
}