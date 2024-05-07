abstract class WeatherEvent {
  const WeatherEvent();
}

class GetCurrentWeather extends WeatherEvent {
  final String locationKey;
  const GetCurrentWeather(this.locationKey);
}