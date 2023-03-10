import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? countryValue;
  String? stateValue;
  String? cityValue;
  late String? cityName;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: (IconButton(
              onPressed: () {
                cityName = cityValue;
                Navigator.pop(context, cityName);
              },
              icon: const Icon(Icons.arrow_back))),
          title: const Text(
            'Choose city',
          ),
          centerTitle: true,
          backgroundColor: Colors.black87,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CSCPicker(
                onCountryChanged: (value) {
                  setState(() {
                    countryValue = value;
                  });
                },
                onStateChanged: (value) {
                  setState(() {
                    stateValue = value;
                  });
                },
                onCityChanged: (value) {
                  setState(() {
                    cityValue = value;
                  });
                },
              ),
              const SizedBox(
                height: 25,
              ),
              Text('Your city ${(cityValue == null) ? 'unknown' : cityValue}',
                  style: const TextStyle(
                    fontSize: 30.0,
                    color: Colors.black87,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
