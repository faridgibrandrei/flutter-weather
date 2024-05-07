import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_the_weather/core/resources/data_state.dart';
import 'package:whats_the_weather/features/weather/domain/usecases/get_forecast.dart';
import 'package:whats_the_weather/features/weather/presentation/bloc/forecast/forecast_event.dart';
import 'package:whats_the_weather/features/weather/presentation/bloc/forecast/forecast_state.dart';

class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {

  final GetForecastUseCase _getForecastUseCase;

  ForecastBloc(this._getForecastUseCase) : super(const ForecastLoading()) {
    on <GetForecast> (onGetForecast);
  }

  void onGetForecast(GetForecast event, Emitter<ForecastState> emit) async {
    final dataState = await _getForecastUseCase(event.locationKey);

    if(dataState is DataSuccess && dataState.data != null) {
      emit(
          ForecastDone(dataState.data!)
      );
    }

    if(dataState is DataFailed) {
      print(dataState.error!.message);
      emit(
          ForecastError(dataState.error!)
      );
    }
  }
}