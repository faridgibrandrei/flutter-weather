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
        FutureBuilder<bool?>(
            future: Utils.isFahrenheit(),
            builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  // If an error occurs while fetching data, display an error message
                  return Text('Error: ${snapshot.error}');
                } else {
                  if (snapshot.data!) {
                    // display in fahrenheit
                    return Text("${currentWeatherModel?.temperature.imperial.value.round()}\u00B0",
                        style: TextStyle(
                            color: Utils.isDarkMode(context)? const Color(0xfffdfcfd) : const Color(0xff322362),
                            fontSize: 64,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins'
                        )
                    );
                  } else {
                    // display in celsius
                    return Text("${currentWeatherModel?.temperature.metric.value.round()}\u00B0",
                        style: TextStyle(
                            color: Utils.isDarkMode(context)? const Color(0xfffdfcfd) : const Color(0xff322362),
                            fontSize: 64,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins'
                        )
                    );
                  }
                }
            }),
        // Text("${currentWeatherModel?.temperature.metric.value.round()}\u00B0",
        //     style: TextStyle(
        //         color: Utils.isDarkMode(context)? const Color(0xfffdfcfd) : const Color(0xff322362),
        //         fontSize: 64,
        //         fontWeight: FontWeight.bold,
        //         fontFamily: 'Poppins'
        //     )
        // ),
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
