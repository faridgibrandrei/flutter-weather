import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
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
            return _loadingIndicator('(PERMISSION) SABAR BOS');
        } else if (snapshot.hasError) {
            return _requestPermission();
        } else {
            final locationData = snapshot.data!;
            return BlocProvider<LocationBloc>(
              create: (context) => sl()..add(GetLocationKey("${locationData.latitude},${locationData.longitude}")),
              child: BlocBuilder<LocationBloc, LocationState> (
                  builder: (_, locationState) {
                    if (locationState is LocationLoading) {
                      return _loadingIndicator('(LOCATION) SABAR BOS');
                    }
                    if (locationState is LocationError) {
                      return _displayError('(LOCATION) GAGAL BOS');
                    }
                    if (locationState is LocationDone) {
                      print('(LOCATION) KELAR BOS');
                      return BlocProvider<WeatherBloc>(
                        create: (context) => sl()..add(GetCurrentWeather(locationState.locationKeyModel?.key ?? '')),
                        child: BlocBuilder<WeatherBloc, WeatherState> (
                            builder: (_, weatherState) {
                              if (weatherState is WeatherLoading) {
                                return _loadingIndicator('(WEATHER) SABAR BOS');
                              }
                              if (weatherState is WeatherError) {
                                return _displayError('(WEATHER) GAGAL BOS');
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
              return _loadingIndicator('(WEATHER) SABAR BOS');
            }
            if (weatherState is WeatherError) {
              return _displayError('(WEATHER) GAGAL BOS');
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
      title: Center(
        child: Text(title!=''? title : appName,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }

  _loadingIndicator(String debugText) {
    print(debugText);
    return Scaffold(
        appBar: _buildAppbar(context, ''),
        body: Container(
            decoration: const BoxDecoration(
              color: Color(0xffDDECFA),
            ),
            padding: const EdgeInsets.all(24),
            child: const Center(child: CupertinoActivityIndicator())));
  }

  _requestPermission() {
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
                child: Lottie.asset("assets/animations/location_animation.json"),
              ),
              const Text(
                permissionRequired,
                textAlign: TextAlign.center,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue, // background
                  backgroundColor: Colors.blue[100], // foreground
                ),
                onPressed: () async {
                  if (await Permission.location.serviceStatus.isEnabled) {
                    var status = await Permission.location.status;
                    if (status.isGranted) {
                      print('(PERMISSION) Location permission is granted');
                      setState(() {});
                    } else if (status.isPermanentlyDenied) {
                      print('(PERMISSION) Location permission is permanently denied');
                      openAppSettings();
                    } else if (status.isDenied) {
                      print('(PERMISSION) Location permission is not granted');
                      Map<Permission, PermissionStatus> status = await [
                        Permission.location,
                      ].request();
                    }
                  } else {
                    print('(PERMISSION) Location service is disabled');
                  }
                },
                child: const Text(grantPermission),
              )
            ],
          ),
        ),
      ),
    );
  }

  _displayError(String debugText) {
    print(debugText);
    return Scaffold(
      appBar: _buildAppbar(context, ''),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(left: 36, right: 36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset("assets/animations/connection_animation.json"),
              const Text('Please check internet connection or the API'),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue, // background
                  backgroundColor: Colors.blue[100], // foreground
                ),
                onPressed: () async {
                  if (await Permission.location.serviceStatus.isEnabled) {
                    var status = await Permission.location.status;
                    if (status.isGranted) {
                      print('(PERMISSION) Location permission is granted');
                      setState(() {});
                    } else if (status.isPermanentlyDenied) {
                      print('(PERMISSION) Location permission is permanently denied');
                      openAppSettings();
                    } else if (status.isDenied) {
                      print('(PERMISSION) Location permission is not granted');
                      Map<Permission, PermissionStatus> status = await [
                        Permission.location,
                      ].request();
                    }
                  } else {
                    print('(PERMISSION) Location service is disabled');
                  }
                },
                child: const Text(refreshPage),
              )
            ],
          ),
        ),),);
  }

  void handleDrawerClosed() {
    setState(() {});
  }
}
