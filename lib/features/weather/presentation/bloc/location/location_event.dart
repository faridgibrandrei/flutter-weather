abstract class LocationEvent {
  const LocationEvent();
}

class GetLocationKey extends LocationEvent {
  final String latlong;
  const GetLocationKey(this.latlong);
}