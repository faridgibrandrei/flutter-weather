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
                        style: Theme.of(context).textTheme.displayLarge,
                    );
                  } else {
                    // display in celsius
                    return Text("${currentWeatherModel?.temperature.metric.value.round()}\u00B0",
                        style: Theme.of(context).textTheme.displayLarge,
                    );
                  }
                }
            }),
        const SizedBox(width: 24),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${currentWeatherModel?.weatherText}",
                style: Theme.of(context).textTheme.displayMedium,
            ),
            Text("humidity: ${currentWeatherModel?.relativeHumidity}%",
                style: Theme.of(context).textTheme.displaySmall,
            ),
            Text("wind: ${currentWeatherModel?.wind.speed.metric.value} km/h",
                style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        )
      ],
    );
  }
}
