import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:weather_homework/models/weather_forecast_daily.dart';
import 'package:weather_homework/utilities/location.dart';

import '../utilities/constants.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast({required String cityName, required bool isCity}) async {
    Map<String,String> parametrs;
    if(isCity){
      var queryParametrs = {
      'APPID': Constants.weatherAppId,
      'units': 'metric',
      'q': cityName,
    };
    parametrs = queryParametrs;

    }else{
      Location location = Location();
      await location.getCurrentLocation();
      var queryParametrs = {
      'APPID': Constants.weatherAppId,
      'units': 'metric',
      'lat': location.latitude.toString(),
      'lon': location.longitude.toString(),
    };
    parametrs = queryParametrs;
    }



    
    var uri = Uri.https(Constants.weatherBaseUrlDomain,
        Constants.weatherForecastPath, parametrs);
    log('request ${uri.toString()}');
    var response = await http.get(uri);
    debugPrint('response ${response.body}');
    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error response');
    }
  }
}
