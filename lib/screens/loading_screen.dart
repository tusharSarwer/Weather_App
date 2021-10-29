// ignore_for_file: use_key_in_widget_constructors, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';
import 'package:weather_app/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    getLocationData();
    print('this line of code triggered');
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeatherData();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(
          locationWeather: weatherData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitDoubleBounce(
        color: Colors.blue,
        size: 100.0,
      ),
    );
  }
}
