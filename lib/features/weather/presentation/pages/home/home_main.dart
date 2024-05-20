import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:whats_the_weather/core/constants/constants.dart';
import 'package:whats_the_weather/core/util/utils.dart';
import 'package:whats_the_weather/features/weather/presentation/bloc/location/location_bloc.dart';
import 'package:whats_the_weather/features/weather/presentation/bloc/location/location_event.dart';
import 'package:whats_the_weather/features/weather/presentation/bloc/location/location_state.dart';
import 'package:whats_the_weather/features/weather/presentation/bloc/search/search_bloc.dart';
import 'package:whats_the_weather/features/weather/presentation/bloc/search/search_event.dart';
import 'package:whats_the_weather/features/weather/presentation/bloc/weather/accu/weather_bloc.dart';
import 'package:whats_the_weather/features/weather/presentation/bloc/weather/accu/weather_event.dart';
import 'package:whats_the_weather/features/weather/presentation/bloc/weather/accu/weather_state.dart';
import 'package:whats_the_weather/features/weather/presentation/pages/home/home_body.dart';
import 'package:whats_the_weather/features/weather/presentation/pages/location_service.dart';
import 'package:whats_the_weather/features/weather/presentation/widgets/leading_drawer.dart';
import 'package:whats_the_weather/injection_container.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key, this.locationKey, this.locationName});

  final String? locationKey;
  final String? locationName;

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> with TickerProviderStateMixin {

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.locationKey == null ? FutureBuilder<Position>(
      future: LocationService().getCurrentLocation(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while waiting for the location data
          return Scaffold(
              appBar: _buildAppbar(context, ''),
              body: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffDDECFA),
                  ),
                  child: const Center(child: CupertinoActivityIndicator())));
        } else if (snapshot.hasError) {
          // If an error occurred while fetching the location, handle it here
          return Scaffold(
            appBar: _buildAppbar(context, ''),
            body: Container(
              decoration: const BoxDecoration(
                color: Color(0xffDDECFA),
              ),
              padding: const EdgeInsets.all(24),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 36, right: 36),
                      child: Lottie.asset("assets/animations/error_animation.json"),
                    ),
                    const Text('Please grant location permission!',
                    textAlign: TextAlign.center,),
                  ],
                ),
              ),
            ),
          );
        } else {
          //WITHOUT API
          // return Scaffold(
          //   appBar: _buildAppbar("Whats The Weather"),
          //   drawer: LeadingDrawer(parentContext: context),
          //   body: HomeBody(),
          // );

          // Location data collected
          final locationData = snapshot.data!;
          return BlocProvider<LocationBloc>(
            create: (context) => sl()..add(GetLocationKey("${locationData.latitude},${locationData.longitude}")),
            child: BlocBuilder<LocationBloc, LocationState> (
                builder: (_, locationState) {
                  if (locationState is LocationLoading) {
                    print('(LOCATION) SABAR BOS');
                    return Scaffold(
                        appBar: _buildAppbar(context, ''),
                        body: const Center(child: CupertinoActivityIndicator()));
                  }
                  if (locationState is LocationError) {
                    print('(LOCATION) GAGAL BOS');
                    print(locationState.error!.message);
                    return Scaffold(
                      appBar: _buildAppbar(context, ''),
                      body: Center(
                      child: Container(
                        margin: const EdgeInsets.only(left: 36, right: 36),
                        child: Column(
                          children: [
                            Lottie.asset("assets/animations/error_animation.json"),
                          ],
                        ),
                      ),),);
                  }
                  if (locationState is LocationDone) {
                    print('(LOCATION) KELAR BOS');
                    return BlocProvider<WeatherBloc>(
                      create: (context) => sl()..add(GetCurrentWeather(locationState.locationKeyModel?.key ?? '')),
                      child: BlocBuilder<WeatherBloc, WeatherState> (
                          builder: (_, weatherState) {
                            if (weatherState is WeatherLoading) {
                              print('(WEATHER) SABAR BOS');
                              return Scaffold(
                                  appBar: _buildAppbar(context, ''),
                                  body: const Center(child: CupertinoActivityIndicator()));
                            }
                            if (weatherState is WeatherError) {
                              print('(WEATHER) GAGAL BOS');
                              return Scaffold(
                                appBar: _buildAppbar(context, ''),
                                body: Center(
                                child: Container(
                                  margin: const EdgeInsets.only(left: 36, right: 36),
                                  child: Column(
                                    children: [
                                      Lottie.asset("assets/animations/error_animation.json"),
                                    ],
                                  ),
                                ),),);
                            }
                            if (weatherState is WeatherDone) {
                              print('(WEATHER) KELAR BOS');
                              return Scaffold(
                                appBar: _buildAppbar(context, locationState.locationKeyModel?.localizedName ?? ''),
                                drawer: LeadingDrawer(parentContext: context, onTempChange: handleDrawerClosed),
                                body: HomeBody(
                                    currentWeatherModel: weatherState.currentWeatherModel,
                                    locationKey: locationState.locationKeyModel?.key ?? '',
                                    locationName: locationState.locationKeyModel?.localizedName ?? ''),
                              );
                            }
                            return const SizedBox();
                          }
                      ),
                    );
                  }
                  return const SizedBox();
                }
            ),
          );
        }
      },
    ) : BlocProvider<WeatherBloc>(
      create: (context) => sl()..add(GetCurrentWeather(widget.locationKey!)),
      child: BlocBuilder<WeatherBloc, WeatherState> (
          builder: (_, weatherState) {
            if (weatherState is WeatherLoading) {
              print('(WEATHER) SABAR BOS');
              return Scaffold(
                  appBar: _buildAppbar(context, ''),
                  body: const Center(child: CupertinoActivityIndicator()));
            }
            if (weatherState is WeatherError) {
              print('(WEATHER) GAGAL BOS');
              return Scaffold(
                appBar: _buildAppbar(context, ''),
                body: Center(
                child: Container(
                  margin: const EdgeInsets.only(left: 36, right: 36),
                  child: Column(
                    children: [
                      Lottie.asset("assets/animations/error_animation.json"),
                    ],
                  ),
                ),),);
            }
            if (weatherState is WeatherDone) {
              print('(WEATHER) KELAR BOS');
              return Scaffold(
                appBar: _buildAppbar(context, widget.locationName!),
                drawer: LeadingDrawer(parentContext: context, onTempChange: handleDrawerClosed),
                body: HomeBody(
                    currentWeatherModel: weatherState.currentWeatherModel,
                    locationKey: widget.locationKey!,
                    locationName: widget.locationName),
              );
            }
            return const SizedBox();
          }
      ),
    );
  }

  _buildAppbar(BuildContext context, String title) {
    return AppBar(
      title: Text(title!=''? title : appName,
        style: Theme.of(context).appBarTheme.titleTextStyle,
        // TextStyle(
        //   color: Utils.isDarkMode(context)? const Color(0xffFFFFFF) : const Color(0xff322362),
        //   fontSize: 18,
        //   fontWeight: FontWeight.bold,
        //   fontFamily: 'Poppins'
        // ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      // backgroundColor: Utils.isDarkMode(context)? const Color(0xff342563) : const Color(0xffDDECFA),
    );
  }

  void handleDrawerClosed() {
    setState(() {});
  }
}
