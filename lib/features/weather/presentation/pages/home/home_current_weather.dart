import 'package:flutter/material.dart';
import 'package:whats_the_weather/core/util/utils.dart';
import 'package:whats_the_weather/features/weather/data/models/accu/current_weather_model.dart';

class HomeCurrentWeather extends StatelessWidget {
  const HomeCurrentWeather({super.key, required this.currentWeatherModel});

  final CurrentWeatherModel? currentWeatherModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 48),
        Text("${currentWeatherModel?.temperature.metric.value.round()}\u00B0",
            style: TextStyle(
                color: Utils.isDarkMode(context)? const Color(0xfffdfcfd) : const Color(0xff322362),
                fontSize: 64,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins'
            )
        ),
        const SizedBox(width: 24),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${currentWeatherModel?.weatherText}",
                style: TextStyle(
                    color: Utils.isDarkMode(context)? const Color(0xfffdfcfd) : const Color(0xff322362),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'
                )
            ),
            Text("humidity: ${currentWeatherModel?.relativeHumidity}%",
                style: TextStyle(
                    color: Utils.isDarkMode(context)? const Color(0xfffdfcfd) : const Color(0xff322362),
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Poppins'
                )
            ),
            Text("wind: ${currentWeatherModel?.wind.speed.metric.value} km/h",
                style: TextStyle(
                    color: Utils.isDarkMode(context)? const Color(0xfffdfcfd) : const Color(0xff322362),
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Poppins'
                )
            ),
          ],
        )
      ],
    );
  }
}
