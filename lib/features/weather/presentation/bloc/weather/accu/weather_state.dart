import 'package:equatable/equatable.dart';
import 'package:whats_the_weather/features/weather/data/models/accu/current_weather_model.dart';
import 'package:dio/dio.dart';

abstract class WeatherState extends Equatable {
  final CurrentWeatherModel ? currentWeatherModel;
  final DioError ? error;

  const WeatherState({this.currentWeatherModel, this.error});

  @override
  List<Object> get props => [currentWeatherModel!, error!];
}

class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

class WeatherDone extends WeatherState {
  const WeatherDone(CurrentWeatherModel currentWeatherModel) : super(currentWeatherModel: currentWeatherModel);
}

class WeatherError extends WeatherState {
  const WeatherError(DioError error) : super(error: error);
}