import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:whats_the_weather/core/util/utils.dart';
import 'package:whats_the_weather/features/weather/data/models/accu/daily_forecast_model.dart';

class ForecastItem extends StatelessWidget {
  const ForecastItem({super.key, this.dailyForecast});

  final DailyForecast? dailyForecast;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          Container(
            child: Lottie.asset(
              "assets/animations/sunny_animation.json",
              width: 50,
              height: 50,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            '${dailyForecast?.temperature.minimum.value.round()}\u00B0 / ${dailyForecast?.temperature.maximum.value.round()}\u00B0',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}
