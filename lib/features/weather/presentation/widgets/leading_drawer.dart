import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:whats_the_weather/features/weather/presentation/provider/theme_provider.dart';
import 'package:whats_the_weather/core/util/pref_helper.dart';
import 'package:whats_the_weather/features/weather/presentation/pages/home/home_main.dart';
import 'package:whats_the_weather/features/weather/presentation/pages/saved_location/saved_location_main.dart';
import 'package:whats_the_weather/features/weather/presentation/pages/search/search_main.dart';
import 'package:provider/provider.dart';

class LeadingDrawer extends StatelessWidget {
  const LeadingDrawer({super.key, required this.parentContext, required this.onTempChange});

  final BuildContext parentContext;
  final Function onTempChange;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
            // padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                ),
                child: const Center(
                  child: Text(
                    'What\'s The Weather',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text('My Location'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeMain()));
                },
              ),
              ListTile(
                title: Text('Search'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchMain()));
                },
              ),
              ListTile(
                title: Text('Saved Location'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SavedLocationMain()));
                },
              ),
              const SizedBox(height: 36,),
              FutureBuilder<int?>(
                future: PrefHelper.getIntValue(PrefHelper.temperatureState),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                      return _temperatureToggle(snapshot.data!);
                  } else if (snapshot.hasError) {
                      return _temperatureToggle(snapshot.data!);
                  } else {
                      return _temperatureToggle(snapshot.data!);
                  }
                },
              ),
              const SizedBox(height: 24,),
              FutureBuilder<int?>(
                future: PrefHelper.getIntValue(PrefHelper.themeState),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                      return _themeToggle(context, snapshot.data!);
                  } else if (snapshot.hasError) {
                      return _themeToggle(context, snapshot.data!);
                  } else {
                      return _themeToggle(context, snapshot.data!);
                  }
                },
              ),
            ],
          ),
      );
  }

  _temperatureToggle(int index) {
    return Column(
      children: [
        const Text("Temperature Unit"),
        ToggleSwitch(
          animate: true,
          animationDuration: 200,
          activeBgColor: const [Color(0xff60a1dc)],
          activeFgColor: Colors.white,
          inactiveBgColor: const Color(0xff777777),
          inactiveFgColor: Colors.white,
          initialLabelIndex: index,
          totalSwitches: 2,
          centerText: true,
          labels: const ['\u00B0C', '\u00B0F'],
          onToggle: (index) {
            onTempChange();
            PrefHelper.saveIntValue(PrefHelper.temperatureState, index!);
            print('switched to: $index');
          },
        ),
      ],
    );
  }

  _themeToggle(BuildContext context, int index) {
    return Column(
      children: [
        const Text("Theme Selection"),
        ToggleSwitch(
          animate: true,
          animationDuration: 200,
          activeBgColor: const [Color(0xff60a1dc)],
          activeFgColor: Colors.white,
          inactiveBgColor: const Color(0xff777777),
          inactiveFgColor: Colors.white,
          initialLabelIndex: index,
          totalSwitches: 2,
          centerText: true,
          labels: const ['Light', 'Dark'],
          onToggle: (index) {
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme(index!);
            PrefHelper.saveIntValue(PrefHelper.themeState, index);
          },
        ),
      ],
    );
  }
}
