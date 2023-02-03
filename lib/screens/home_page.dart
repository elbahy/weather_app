import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/screens/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (crx) {
                return SearchPage(updateUi);
              })),
            ),
          ),
        ],
      ),
      body: weatherData2 != null
          ? Container(
              color: Colors.deepOrange,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 45),
                    child: Row(
                      children: [
                        Icon(Icons.cloud_queue, color: Colors.white, size: 32),
                        Text('${weatherData2!.cloud}%'),
                        Spacer(flex: 1),
                        Icon(Icons.wind_power_outlined,
                            color: Colors.white, size: 32),
                        Text('${weatherData2!.wind} KM/S'),
                        Spacer(flex: 1),
                        Icon(Icons.water_drop_outlined,
                            color: Colors.white, size: 32),
                        Text('${weatherData2!.humidity}'),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${weatherData2!.temp.toInt()}',
                          style: TextStyle(fontSize: 145, color: Colors.white)),
                      Column(
                        children: [
                          Text('°C',
                              style:
                                  TextStyle(fontSize: 48, color: Colors.white)),
                          Row(
                            children: [
                              Icon(Icons.arrow_upward, color: Colors.white),
                              Text('${weatherData2!.maxTemp.toInt()}',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24))
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.arrow_downward, color: Colors.white),
                              Text('${weatherData2!.minTemp.toInt()}',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Text(
                      '${weatherData2!.location}, ${weatherData2!.region}, ${weatherData2!.country}',
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text('${weatherData2!.lastUpdate}',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                  Spacer(flex: 1),
                  Text('${weatherData2!.condition}',
                      style: TextStyle(fontSize: 32, color: Colors.white)),
                  Image.network('https:${weatherData2!.icon}'),
                  Spacer(
                    flex: 2,
                  )
                ],
              ),
            )
          : Text('not found'),
    );
  }
}
