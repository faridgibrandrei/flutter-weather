import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:whats_the_weather/core/util/utils.dart';
import 'package:whats_the_weather/features/weather/data/models/accu/current_weather_model.dart';
import 'package:whats_the_weather/features/weather/presentation/bloc/forecast/forecast_bloc.dart';
import 'package:whats_the_weather/features/weather/presentation/bloc/forecast/forecast_event.dart';
import 'package:whats_the_weather/features/weather/presentation/bloc/forecast/forecast_state.dart';
import 'package:whats_the_weather/features/weather/presentation/pages/home/home_current_weather.dart';
import 'package:whats_the_weather/features/weather/presentation/widgets/forecast_item.dart';
import 'package:whats_the_weather/injection_container.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key, this.currentWeatherModel, this.locationKey});

  final CurrentWeatherModel? currentWeatherModel;
  final String? locationKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Utils.isDarkMode(context)? const Color(0xff342563) : const Color(0xffDDECFA),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Lottie.asset("assets/animations/sunny.json",
              width: 250,
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(height: 28),
          HomeCurrentWeather(currentWeatherModel: currentWeatherModel),
          Expanded(child: Container()),
          Container(
            margin: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
              decoration: BoxDecoration(
                color: Utils.isDarkMode(context)? const Color(0xff4A3B7A) : const Color(0xffEBF4F9),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("5-Days Forecast",
                      style: TextStyle(
                          color: Utils.isDarkMode(context)? const Color(0xfffdfcfd) : const Color(0xff322362),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'
                      )
                  ),
                  SizedBox(height: 20.0),

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
                                  child: Center(
                                    child: Text("CAPEDEW"),
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
}
