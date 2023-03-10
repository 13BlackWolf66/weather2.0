import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Util {
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat('EEE, MMM d, y').format(dateTime);
  }

  static getItem(IconData iconData, int value, String units) {
    return Column(
      children: [
        Icon(
          iconData,
          size: 28.0,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          '$value',
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.black87,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          units,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
