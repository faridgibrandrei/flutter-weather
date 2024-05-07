import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:whats_the_weather/features/weather/data/models/accu/forecast_model.dart';

abstract class ForecastState extends Equatable {
  final ForecastModel ? forecastModel;
  final DioError ? error;

  const ForecastState({this.forecastModel, this.error});

  @override
  List<Object> get props => [forecastModel!, error!];
}

class ForecastLoading extends ForecastState {
  const ForecastLoading();
}

class ForecastDone extends ForecastState {
  const ForecastDone(ForecastModel forecastModel) : super(forecastModel: forecastModel);
}

class ForecastError extends ForecastState {
  const ForecastError(DioError error) : super(error: error);
}