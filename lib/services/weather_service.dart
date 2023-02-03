import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class WeatherService {
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String APIKey = '0bb1e8506e5943ef90e183529232801';

  Future<WeatherModel> getWeather(String city) async {
    http.Response response = await http
        .get(Uri.parse('$baseUrl/forecast.json?key=$APIKey&q=$city&days=1'));
    Map<String, dynamic> data = jsonDecode(response.body);
    WeatherModel weather = WeatherModel.fromJson(data);
    return weather;
  }
}
