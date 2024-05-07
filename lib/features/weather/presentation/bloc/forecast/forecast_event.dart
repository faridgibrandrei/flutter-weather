abstract class ForecastEvent {
  const ForecastEvent();
}

class GetForecast extends ForecastEvent {
  final String locationKey;
  const GetForecast(this.locationKey);
}