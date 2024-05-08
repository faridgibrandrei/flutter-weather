import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_the_weather/core/util/utils.dart';
import 'package:whats_the_weather/features/weather/presentation/bloc/search/search_bloc.dart';
import 'package:whats_the_weather/features/weather/presentation/bloc/search/search_event.dart';
import 'package:whats_the_weather/features/weather/presentation/bloc/search/search_state.dart';
import 'package:whats_the_weather/features/weather/presentation/pages/home/home_main.dart';
import 'package:whats_the_weather/injection_container.dart';

class SearchMain extends StatefulWidget {
  const SearchMain({super.key});

  @override
  State<SearchMain> createState() => _SearchMainState();
}

class _SearchMainState extends State<SearchMain> {

  final TextEditingController _searchController = TextEditingController();
  final String _query = '';

  @override
  void initState() {
    super.initState();
  }

  Future<String> _fetchQuery() async {
    // Simulate fetching data from an API
    await Future.delayed(const Duration(milliseconds: 10));
    String query = _searchController.text.toLowerCase();

    // Return an empty string if query is empty
    return query.isNotEmpty ? query : '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppbar("Search"),
        body: Container(
          decoration: BoxDecoration(
            color: Utils.isDarkMode(context)? const Color(0xff342563) : const Color(0xffDDECFA),
          ),
          child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            decoration: const InputDecoration(
                              labelText: 'Search City',
                              hintText: 'Enter a city name',
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {
                            setState(() {});
                          },
                        ),
                      ],
                  ),
                ),
                FutureBuilder(
                  future: _fetchQuery(),
                  builder: (context, snapshot) {
                    print('snapshot.data : ${snapshot.data}');
                    print('snapshot.requireData : ${snapshot.requireData}');
                    if (snapshot.data != null && snapshot.data != _query) {
                      return Expanded(
                        child: BlocProvider<SearchBloc>(
                          create: (context) => sl()..add(GetMatchLocation(snapshot.requireData)),
                          child: BlocBuilder<SearchBloc, SearchState>(
                            builder: (context, state) {
                              if (state is SearchLoading) {
                                print('(SEARCH) SABAR BOS');
                                return const Center(child: CircularProgressIndicator());
                              }
                              if (state is SearchError) {
                                print('(SEARCH) GAGAL BOS');
                                return Center(child: Text('Error: ${state.error}'));
                              }
                              if (state is SearchDone) {
                                print('(SEARCH) KELAR BOS');
                                return ListView.builder(
                                  itemCount: _maxItemCount(state.matchLocationKeyModels!.length),
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(state.matchLocationKeyModels?[index].localizedName ?? 'null'),
                                      onTap: () {
                                        String locationKey = state.matchLocationKeyModels![index].key;
                                        String locationName = state.matchLocationKeyModels![index].localizedName;

                                        Navigator.pop(context);
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeMain(locationKey: locationKey, locationName: locationName,)));
                                        print('Selected city: ${state.matchLocationKeyModels?[index].localizedName}');
                                      },
                                    );
                                  },
                                );
                              }
                              return const SizedBox();
                            },
                          ),
                        ),
                      );
                    }  else {
                      print("no query");
                      return const SizedBox(height: 20,);
                    }
                  },
                ),
              ],
            ),
        ),
      );
  }

  int _maxItemCount(int length) {
    if(length > 5) {
      return 5;
    } else {
      return length;
    }
  }

  _buildAppbar(String title) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
            color: Utils.isDarkMode(context)? const Color(0xffFFFFFF) : const Color(0xff322362),
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins'
        ),
      ),
      backgroundColor: Utils.isDarkMode(context)? const Color(0xff342563) : const Color(0xffDDECFA),
    );
  }
}
