import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:whats_the_weather/features/weather/data/models/accu/match_location_model.dart';

abstract class SearchState extends Equatable {
  final List<MatchLocationModel> ? matchLocationKeyModels;
  // final MatchLocationModel ? matchLocationKeyModel;
  final DioError ? error;

  const SearchState({this.matchLocationKeyModels, this.error});
  // const SearchState({this.matchLocationKeyModel, this.error});

  @override
  List<Object> get props => [matchLocationKeyModels!, error!];
  // List<Object> get props => [matchLocationKeyModel!, error!];
}

class SearchLoading extends SearchState {
  const SearchLoading();
}

class SearchDone extends SearchState {
  const SearchDone(List<MatchLocationModel> matchLocationKeyModels) : super(matchLocationKeyModels: matchLocationKeyModels);
  // const SearchDone(MatchLocationModel matchLocationKeyModel) : super(matchLocationKeyModel: matchLocationKeyModel);
}

class SearchError extends SearchState {
  const SearchError(DioError error) : super(error: error);
}