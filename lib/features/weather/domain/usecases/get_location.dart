import 'package:whats_the_weather/core/resources/data_state.dart';
import 'package:whats_the_weather/features/weather/data/models/accu/location_key_model.dart';
import 'package:whats_the_weather/features/weather/domain/repository/location_repository.dart';

class GetLocationUseCase {

  final LocationRepository _locationRepository;

  GetLocationUseCase(this._locationRepository);
  @override

  Future<DataState<LocationKeyModel>> call(String latlong) {
    return _locationRepository.getLocationKey(latlong);
  }

}