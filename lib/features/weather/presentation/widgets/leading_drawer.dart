import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:whats_the_weather/features/weather/presentation/pages/home/home_main.dart';
import 'package:whats_the_weather/features/weather/presentation/pages/search/search_main.dart';

class LeadingDrawer extends StatelessWidget {
  const LeadingDrawer({super.key, required this.parentContext});

  final BuildContext parentContext;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
            // padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xff76ADDE),
                ),
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
              ListTile(
                title: Text('My Location'),
                onTap: () {
                  // Navigate to page 1
                  Navigator.pop(context); // Close the drawer

                  // Add your navigation logic here
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeMain()));
                },
              ),
              ListTile(
                title: Text('Search'),
                onTap: () {
                  // Navigate to page 2
                  Navigator.pop(context); // Close the drawer
                  // Add your navigation logic here
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchMain()));
                },
              ),
              ListTile(
                title: Text('Saved Location'),
                onTap: () {
                  // Navigate to page 2
                  Navigator.pop(context); // Close the drawer
                  // Add your navigation logic here
                },
              ),
              const SizedBox(height: 36,),
              Container(
                child: Column(
                  children: [
                    const Text("Temperature Unit"),
                    ToggleSwitch(
                      animate: true,
                      animationDuration: 200,
                      activeBgColor: const [Color(0xff60a1dc)],
                      activeFgColor: Colors.white,
                      inactiveBgColor: const Color(0xff777777),
                      inactiveFgColor: Colors.white,
                      initialLabelIndex: 0,
                      totalSwitches: 2,
                      centerText: true,
                      labels: const ['\u00B0C', '\u00B0F'],
                      onToggle: (index) {
                        print('switched to: $index');
                      },
                    ),
                  ],
                ),
              ),
              // Add more list tiles for additional pages
            ],
          ),
      );
  }
}
