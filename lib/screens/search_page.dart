import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/providers/weather_provider.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  SearchPage( {super.key});

  
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
              WeatherModel weatherData = await WeatherService().getWeather(input);
              Provider.of<WeatherProvider>(context,listen: false).weatherData= weatherData;

              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}


