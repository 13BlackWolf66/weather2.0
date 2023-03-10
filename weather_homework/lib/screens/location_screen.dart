import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_homework/api/weather_api.dart';
import 'package:weather_homework/screens/weather_forecast_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  void getLocationData() async {
    var weatherInfo =
        await WeatherApi().fetchWeatherForecast(isCity: false, cityName: '');
    if (weatherInfo == null) {
      return;
    }
    {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return WeatherForecastScreen(
            locationWeather: weatherInfo,
          );
        },
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: SpinKitDoubleBounce(
        color: Colors.black87,
        size: 100.0,
      )),
    );
  }
}
