import 'package:whats_the_weather/features/weather/data/models/accu/location_key_model.dart';
import 'package:whats_the_weather/core/resources/data_state.dart';

abstract class LocationRepository {
  Future<DataState<LocationKeyModel>> getLocationKey(String latlong);
}