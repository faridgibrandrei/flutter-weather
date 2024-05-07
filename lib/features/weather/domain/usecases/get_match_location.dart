import 'package:whats_the_weather/core/resources/data_state.dart';
import 'package:whats_the_weather/features/weather/data/models/accu/match_location_model.dart';
import 'package:whats_the_weather/features/weather/domain/repository/match_location_repository.dart';

class GetMatchLocationUseCase {

  final MatchLocationRepository _matchLocationRepository;

  GetMatchLocationUseCase(this._matchLocationRepository);
  @override

  Future<DataState<List<MatchLocationModel>>> call(String query) {
    return _matchLocationRepository.getMatchLocation(query);
  }

}