import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  SearchPage(this.updateUi, {super.key});

  VoidCallback updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search a City')),
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search',
                hintText: 'Enter a City',
                suffixIcon: Icon(Icons.search_sharp)),
            onSubmitted: (input) async {
              weatherData2 = await WeatherService().getWeather(input);
              updateUi();
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

WeatherModel? weatherData2;
