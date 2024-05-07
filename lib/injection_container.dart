import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:whats_the_weather/features/weather/data/data_sources/remote/accu_weather_api_service.dart';
import 'package:whats_the_weather/features/weather/data/repository/accu_weather_repository_impl.dart';
import 'package:whats_the_weather/features/weather/data/repository/forecast_repository_impl.dart';
import 'package:whats_the_weather/features/weather/data/repository/location_repository_impl.dart';
import 'package:whats_the_weather/features/weather/data/repository/match_location_repository_impl.dart';
import 'package:whats_the_weather/features/weather/domain/repository/accu_weather_repository.dart';
import 'package:whats_the_weather/features/weather/domain/repository/forecast_repository.dart';
import 'package:whats_the_weather/features/weather/domain/repository/location_repository.dart';
import 'package:whats_the_weather/features/weather/domain/repository/match_location_repository.dart';
import 'package:whats_the_weather/features/weather/domain/usecases/get_accu_weather.dart';
import 'package:whats_the_weather/features/weather/domain/usecases/get_forecast.dart';
import 'package:whats_the_weather/features/weather/domain/usecases/get_location.dart';
import 'package:whats_the_weather/features/weather/domain/usecases/get_match_location.dart';
import 'package:whats_the_weather/features/weather/presentation/bloc/forecast/forecast_bloc.dart';
import 'package:whats_the_weather/features/weather/presentation/bloc/location/location_bloc.dart';
import 'package:whats_the_weather/features/weather/presentation/bloc/search/search_bloc.dart';
import 'package:whats_the_weather/features/weather/presentation/bloc/weather/accu/weather_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  //Dio
  sl.registerSingleton<Dio>(Dio());

  //Dependencies
  sl.registerSingleton<AccuWeatherApiService>(AccuWeatherApiService(sl()));

  //Repository
  sl.registerSingleton<LocationRepository>(
      LocationRepositoryImpl(sl())
  );
  sl.registerSingleton<ACCUWeatherRepository>(
      ACCUWeatherRepositoryImpl(sl())
  );
  sl.registerSingleton<ForecastRepository>(
      ForecastRepositoryImpl(sl())
  );
  sl.registerSingleton<MatchLocationRepository>(
      MatchLocationRepositoryImpl(sl())
  );

  //UseCases
  sl.registerSingleton<GetLocationUseCase>(
      GetLocationUseCase(sl())
  );
  sl.registerSingleton<GetACCUWeathersUseCase>(
      GetACCUWeathersUseCase(sl())
  );
  sl.registerSingleton<GetForecastUseCase>(
      GetForecastUseCase(sl())
  );
  sl.registerSingleton<GetMatchLocationUseCase>(
      GetMatchLocationUseCase(sl())
  );

  //Blocs
  sl.registerFactory<LocationBloc>(
          ()=> LocationBloc(sl())
  );
  sl.registerFactory<WeatherBloc>(
          ()=> WeatherBloc(sl())
  );
  sl.registerFactory<ForecastBloc>(
          ()=> ForecastBloc(sl())
  );
  sl.registerFactory<SearchBloc>(
          ()=> SearchBloc(sl())
  );
}