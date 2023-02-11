import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/providers/weather_provider.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/screens/home_page.dart';

void main() async {
  runApp(ChangeNotifierProvider(
    create: (context) => WeatherProvider(),
    child: WeatherApp(),
  ));
}

class WeatherApp extends StatelessWidget {
  WeatherApp({super.key});
  WeatherModel? weather;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
