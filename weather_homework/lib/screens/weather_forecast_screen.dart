import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_homework/api/weather_api.dart';
import 'package:weather_homework/screens/city_screen.dart';
import 'package:weather_homework/widgets/bottom_list_view.dart';
import 'package:weather_homework/widgets/city_view.dart';
import 'package:weather_homework/widgets/detailed_view.dart';
import 'package:weather_homework/widgets/temp_view.dart';

import '../models/weather_forecast_daily.dart';

class WeatherForecastScreen extends StatefulWidget {
  final locationWeather;
  const WeatherForecastScreen({
    super.key,
    this.locationWeather,
  });

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherForecast> forecastObject;
  String cityName = 'Vinnytsia';

  @override
  void initState() {
    super.initState();
    if (widget.locationWeather != null) {
      forecastObject =
          WeatherApi().fetchWeatherForecast(cityName: cityName, isCity: true);
    } else {}

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('openweathermap.org'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.my_location),
          onPressed: () {
            setState(() {
              forecastObject = WeatherApi().fetchWeatherForecast(cityName: '', isCity: false);
            });
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_city),
            onPressed: () async {
              var tappedCity = await Navigator.push(context,
                  MaterialPageRoute(builder: ((context) {
                return const CityScreen();
              })));
              if (tappedCity != null && tappedCity != 'unknown') {
                cityName = tappedCity;
                setState(() {
                  forecastObject = WeatherApi()
                      .fetchWeatherForecast(cityName: cityName, isCity: true);
                });
              }
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          FutureBuilder(
            future: forecastObject,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 50.0,
                    ),
                    CityView(
                      snapshot: snapshot,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TempView(
                      snapshot: snapshot,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    DetailedView(
                      snapshot: snapshot,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    BottomListView(snapshot: snapshot),
                  ],
                );
              } else {
                return const Center(
                  child: SpinKitDoubleBounce(
                    color: Colors.black87,
                    size: 100.0,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
