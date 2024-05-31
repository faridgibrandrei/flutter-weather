import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:whats_the_weather/core/util/sql_helper.dart';
import 'package:whats_the_weather/features/weather/data/models/accu/current_weather_model.dart';
import 'package:whats_the_weather/features/weather/data/models/accu/location_key_model.dart';

abstract class LocationState extends Equatable {
  final LocationKeyModel ? locationKeyModel;
  final DioError ? error;

  const LocationState({this.locationKeyModel, this.error});

  @override
  List<Object> get props => [locationKeyModel!, error!];
}

class LocationLoading extends LocationState {
  const LocationLoading();
}

class LocationDone extends LocationState {
  const LocationDone(LocationKeyModel locationKeyModel) : super(locationKeyModel: locationKeyModel);
}

class LocationError extends LocationState {
  const LocationError(DioError error) : super(error: error);
}