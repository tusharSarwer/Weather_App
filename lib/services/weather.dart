// ignore_for_file: avoid_print

import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

const appKey = 'da58b41c8bb03eca8e66229674257086';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';
// api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

class WeatherModel {
  Future<dynamic> getCityWeatherData(String cityName) async {
    var url =
        Uri.parse('$openWeatherMapUrl?q=$cityName&appid=$appKey&units=metric');

    NetworkHelper networkHelper = NetworkHelper(url: url);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();

    var url = Uri.parse(
        '$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$appKey&units=metric');

    NetworkHelper networkHelper = NetworkHelper(url: url);

    // NetworkHelper networkHelper = NetworkHelper(
    //     url:
    //         'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$appKey&units=metric');

    var weatherData = await networkHelper.getData();
    print(weatherData);
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
