import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_the_weather/core/resources/data_state.dart';
import 'package:whats_the_weather/features/weather/domain/usecases/get_location.dart';
import 'package:whats_the_weather/features/weather/presentation/bloc/location/location_event.dart';
import 'package:whats_the_weather/features/weather/presentation/bloc/location/location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {

  final GetLocationUseCase _getLocationUseCase;

  LocationBloc(this._getLocationUseCase) : super(const LocationLoading()) {
    on <GetLocationKey> (onGetTheLocationKey);
  }

  void onGetTheLocationKey(GetLocationKey event, Emitter<LocationState> emit) async {
    final dataState = await _getLocationUseCase(event.latlong);

    if(dataState is DataSuccess && dataState.data != null) {
      emit(
          LocationDone(dataState.data!)
      );
    }

    if(dataState is DataFailed) {
      emit(
          LocationError(dataState.error!)
      );
    }
  }
}