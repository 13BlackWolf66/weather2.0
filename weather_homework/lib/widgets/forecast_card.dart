import 'package:flutter/material.dart';

import '../utilities/forecast_util.dart';

Widget ForecastCard(AsyncSnapshot snapshot, int index) {
  var forecastList = snapshot.data?.list;
  DateTime dateTime =
      DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Util.getFormattedDate(dateTime);
  var dayOfWeek = fullDate.split(',')[0];
  var icon = forecastList![index].getIconUrl();
  var temp = forecastList[index].temp?.day?.toStringAsFixed(0);

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            dayOfWeek,
            style: const TextStyle(fontSize: 25.0, color: Colors.white),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$temp °C',
            style: const TextStyle(fontSize: 20.0, color: Colors.white),
          ),
          const SizedBox(width: 8.0,),
          Image.network(
          icon,
          //scale: 0.4,
        ),
        ],
      ),
    ],
  );
}
