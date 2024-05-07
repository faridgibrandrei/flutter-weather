abstract class SearchEvent {
  const SearchEvent();
}

class GetMatchLocation extends SearchEvent {
  final String query;
  const GetMatchLocation(this.query);
}