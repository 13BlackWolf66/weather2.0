import 'package:flutter/material.dart';

import '../models/weather_forecast_daily.dart';
import 'forecast_card.dart';

class BottomListView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const BottomListView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '7-Day Weather Forecast'.toUpperCase(),
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: 140.0,
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: ((context, index) => const SizedBox(
                  width: 8.0,
                )),
            itemCount: snapshot.data!.list!.length,
             itemBuilder: ((context, index) => Container(
              height: 160,
              width: MediaQuery.of(context).size.width / 2.7,
              color: Colors.black87,
              child: ForecastCard(snapshot, index),
             )),
          ),
        ),
      ],
    );
  }
}
