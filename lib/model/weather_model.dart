class WeatherModel {
  final String location;
  final String region;
  final String country;
  final String lastUpdate;
  final double temp;
  final double wind;
  final int humidity;
  final int cloud;
  final double maxTemp;
  final double minTemp;
  final String condition;
  final String icon;

  WeatherModel(
      {required this.location,
      required this.region,
      required this.country,
      required this.lastUpdate,
      required this.temp,
      required this.wind,
      required this.humidity,
      required this.cloud,
      required this.maxTemp,
      required this.minTemp,
      required this.condition,
      required this.icon});

  factory WeatherModel.fromJson(dynamic data) {
    var dataOfDay = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        location: data['location']['name'],
        region: data['location']['name'],
        country: data['location']['country'],
        lastUpdate: data['current']['last_updated'],
        temp: data['current']['temp_c'],
        wind: data['current']['wind_kph'],
        humidity: data['current']['humidity'],
        cloud: data['current']['cloud'],
        maxTemp: dataOfDay['maxtemp_c'],
        minTemp: dataOfDay['mintemp_c'],
        condition: data['current']['condition']['text'],
        icon: data['current']['condition']['icon']);
  }
}
