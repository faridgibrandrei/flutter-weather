import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_the_weather/core/resources/data_state.dart';
import 'package:whats_the_weather/features/weather/domain/usecases/get_match_location.dart';
import 'package:whats_the_weather/features/weather/presentation/bloc/search/search_event.dart';
import 'package:whats_the_weather/features/weather/presentation/bloc/search/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  final GetMatchLocationUseCase _getMatchLocationUseCase;

  SearchBloc(this._getMatchLocationUseCase) : super(const SearchLoading()) {
    on <GetMatchLocation> (onGetMatchLocation);
  }

  void onGetMatchLocation(GetMatchLocation event, Emitter<SearchState> emit) async {
    final dataState = await _getMatchLocationUseCase(event.query);

    if(dataState is DataSuccess && dataState.data != null) {
      emit(
          SearchDone(dataState.data!)
      );
    }

    if(dataState is DataFailed) {
      emit(
          SearchError(dataState.error!)
      );
    }
  }
}