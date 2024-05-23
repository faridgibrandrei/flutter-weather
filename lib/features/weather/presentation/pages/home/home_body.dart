import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:whats_the_weather/core/util/sql_helper.dart';
import 'package:whats_the_weather/core/util/utils.dart';
import 'package:whats_the_weather/core/util/pref_helper.dart';
import 'package:whats_the_weather/features/weather/data/models/accu/current_weather_model.dart';
import 'package:whats_the_weather/features/weather/data/models/favorite_loc_model.dart';
import 'package:whats_the_weather/features/weather/presentation/bloc/forecast/forecast_bloc.dart';
import 'package:whats_the_weather/features/weather/presentation/bloc/forecast/forecast_event.dart';
import 'package:whats_the_weather/features/weather/presentation/bloc/forecast/forecast_state.dart';
import 'package:whats_the_weather/features/weather/presentation/pages/home/home_current_weather.dart';
import 'package:whats_the_weather/features/weather/presentation/widgets/forecast_item.dart';
import 'package:whats_the_weather/injection_container.dart';
import 'package:provider/provider.dart';
import 'package:whats_the_weather/features/weather/presentation/favorite_provider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key, this.currentWeatherModel, this.locationKey, this.locationName});

  final CurrentWeatherModel? currentWeatherModel;
  final String? locationKey;
  final String? locationName;

  @override
  Widget build(BuildContext context) {
    bool isFavorite = Provider.of<FavoriteProvider>(context).isFavorite;
    Color iconColor = isFavorite ? const Color(0xffC43667) : const Color(0xffD7D7D7);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Lottie.asset("assets/animations/sunny_animation.json",
              width: 250,
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(height: 28),
          HomeCurrentWeather(currentWeatherModel: currentWeatherModel),
          Expanded(child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () async {
                  await toggleFavoriteStatus(context);
                },
                icon: Icon(Icons.favorite, color: iconColor),
              ),
              Expanded(child: Container())
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                // color: Utils.isDarkMode(context)? const Color(0xff4A3B7A) : const Color(0xffEBF4F9),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("5-Days Forecast",
                      style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 20.0),

                  // ForecastItem
                  BlocProvider<ForecastBloc>(
                    create: (context) => sl()..add(GetForecast(locationKey ?? '')),
                    child: BlocBuilder<ForecastBloc, ForecastState> (
                        builder: (_, forecastState) {
                          if (forecastState is ForecastLoading) {
                            print('(FORECAST) SABAR BOS');
                            return Container(
                              child: const Center(child: CupertinoActivityIndicator()),
                            );
                          }
                          if (forecastState is ForecastError) {
                            print('(FORECAST) GAGAL BOS');
                            return Container(
                                  child: const Center(
                                    child: Text("Failed to retrieve data from server"),
                                    // child: Lottie.asset("assets/animations/sunny.json")
                                    ),
                                  );
                          }
                          if (forecastState is ForecastDone) {
                            print('(FORECAST) KELAR BOS');
                            return Container(
                              height: 100,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: forecastState.forecastModel?.dailyForecasts.length,
                                  itemBuilder: (_, index) {
                                    return ForecastItem(dailyForecast: forecastState.forecastModel?.dailyForecasts[index]);
                                  }
                              ),
                            );
                          }
                          return const SizedBox();
                        }
                    ),
                  ),
                ],
              )
          )
        ],
      ),
    );
  }

  Future<void> toggleFavoriteStatus(BuildContext context) async {
    Provider.of<FavoriteProvider>(context, listen: false).setLocationAndCheckFavorite(locationName!, locationKey!);
  }
}
