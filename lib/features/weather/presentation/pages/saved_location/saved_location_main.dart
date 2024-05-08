import 'package:flutter/material.dart';
import 'package:whats_the_weather/core/util/pref_helper.dart';
import 'package:whats_the_weather/core/util/sql_helper.dart';
import 'package:whats_the_weather/core/util/utils.dart';
import 'package:whats_the_weather/features/weather/data/models/favorite_loc_model.dart';

class SavedLocationMain extends StatefulWidget {
  const SavedLocationMain({super.key});

  @override
  State<SavedLocationMain> createState() => _SavedLocationMainState();
}

class _SavedLocationMainState extends State<SavedLocationMain> {

  List<Map<String, dynamic>> _journals = [];

  void _refresh() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    Future<FavoriteLoc?> favoriteLoc = PrefHelper.getFavoriteLocation();

    return Scaffold(
      appBar: _buildAppbar("Saved Location"),
      body: Container(
        child: ListView.builder(
          itemCount: _journals.length,
          itemBuilder: (context, index) => Card(
              color: Colors.orange[200],
              margin: const EdgeInsets.all(15),
              child: ListTile(
                  title: Text(_journals[index]['title']),
                  subtitle: Text(_journals[index]['description']),
              ),
          ),
        )
      )
    );
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
