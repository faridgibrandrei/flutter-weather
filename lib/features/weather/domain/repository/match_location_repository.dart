import 'package:whats_the_weather/core/resources/data_state.dart';
import 'package:whats_the_weather/features/weather/data/models/accu/match_location_model.dart';

abstract class MatchLocationRepository {
  Future<DataState<List<MatchLocationModel>>> getMatchLocation(String query);
}