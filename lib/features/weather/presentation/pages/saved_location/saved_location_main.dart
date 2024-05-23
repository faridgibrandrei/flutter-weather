import 'package:flutter/material.dart';
import 'package:whats_the_weather/core/constants/constants.dart';
import 'package:whats_the_weather/core/util/pref_helper.dart';
import 'package:whats_the_weather/core/util/sql_helper.dart';
import 'package:whats_the_weather/core/util/utils.dart';
import 'package:whats_the_weather/features/weather/data/models/favorite_loc_model.dart';
import 'package:whats_the_weather/features/weather/presentation/pages/home/home_main.dart';

class SavedLocationMain extends StatefulWidget {
  const SavedLocationMain({super.key});

  @override
  State<SavedLocationMain> createState() => _SavedLocationMainState();
}

class _SavedLocationMainState extends State<SavedLocationMain> {

  List<Map<String, dynamic>> _savedLocation = [];

  void _refresh() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _savedLocation = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar("Saved Location"),
      body: Container(
        child: ListView.builder(
          itemCount: _savedLocation.length,
          itemBuilder: (context, index) => Card(
              color: Utils.isDarkMode(context)? const Color(0xff4A3B7A) : const Color(0xffEBF4F9),
              // color: Colors.orange[200],
              margin: const EdgeInsets.all(15),
              child: ListTile(
                  title: Text(_savedLocation[index]['locationName']),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeMain(locationKey: _savedLocation[index]['locationKey'], locationName: _savedLocation[index]['locationName'])));
                  }
              ),
          ),
        )
      )
    );
  }

  _buildAppbar(String title) {
    return AppBar(
      title: Text(title!=''? title : appName,
        style: Theme.of(context).appBarTheme.titleTextStyle,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
