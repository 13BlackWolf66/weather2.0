import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_homework/models/weather_forecast_daily.dart';

import '../utilities/forecast_util.dart';

class DetailedView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const DetailedView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var preassure = forecastList![0].pressure! * 0.750062;
    var humidity = forecastList[0].humidity!;
    var wind = forecastList[0].speed!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Util.getItem(FontAwesomeIcons.temperatureThreeQuarters,
            preassure.round(), 'mm Hg'),
        Util.getItem(FontAwesomeIcons.cloudRain, humidity, '%'),
        Util.getItem(FontAwesomeIcons.wind, wind.toInt(), 'm/s'),
      ],
    );
  }
}
