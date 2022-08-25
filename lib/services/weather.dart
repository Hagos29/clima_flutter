import 'package:clima_flutter/services/networking.dart';
import 'package:clima_flutter/services/location.dart';

const openWeatherURL='https://api.openweathermap.org/data/2.5/weather';

const apiKeys = '79c6e454fe32cb9c4eec8bdeb7dc8a22';

class WeatherModel {

  void getCityWeather(String cityName){
 NetworkHelper networkHelper=NetworkHelper(Uri.parse('$openWeatherURL?q=$cityName&appid=$apiKeys&units=metric'));
  }
Future<dynamic> getWeatherLocation() async{
   // ignore: unused_local_variable
    Location location = Location();
    await location.getCurrentLocation();
    
    NetworkHelper networkHelper = NetworkHelper(Uri.parse(
        '$openWeatherURL?lat=${location.latitude}&lon=${location.longitude}e&appid=$apiKeys&units=metric'));
    var weatherData = await networkHelper.getData();
}

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}


