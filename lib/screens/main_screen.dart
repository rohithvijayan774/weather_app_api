import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_sample/models/weather_model.dart';
import 'package:weather_app_sample/models/weather_service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  WeatherService weatherService = WeatherService();
  Weather weather = Weather();

  String currentWeather = '';
  double tempC = 0;
  double feelsC = 0;
  String locationName = '';
  String localTime = '';
  String regionName = '';
  String countryName = '';
  double windSpeedKph = 0;
  int humidityPercent = 0;
  int isDay = 0;
  String bgImage = '';
  TextEditingController searchController = TextEditingController();

  // @override
  // void dispose() {
  //   searchController.dispose();
  //   super.dispose();
  // }

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  void getWeather() async {
    if (searchController.text.isEmpty) {
      log('message');
      weather = await weatherService.getWeatherData('Kozhikode');
    } else {
      weather = await weatherService.getWeatherData(searchController.text);
    }

    if (weather.isDay == 0) {
      bgImage =
          'https://images.wallpaperscraft.com/image/single/night_forest_mountains_144768_540x960.jpg';
    } else {
      bgImage =
          'https://images.wallpaperscraft.com/image/single/dawn_fog_morning_149465_2160x3840.jpg';
    }

    setState(() {
      locationName = weather.name;
      currentWeather = weather.condition;
      tempC = weather.temperatureC;
      regionName = weather.region;
      countryName = weather.country;
      feelsC = weather.feelsLikeC;
      windSpeedKph = weather.windKph;
      humidityPercent = weather.humidity;
      localTime = weather.localTime;
      // final _date = DateTime.parse(localTime);
      // final formattedDate = DateFormat.yMMMd('en_US').format(_date);
      // print(formattedDate);
      // print(formattedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              bgImage,
              // 'https://images.unsplash.com/photo-1530908295418-a12e326966ba?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
              // 'https://c4.wallpaperflare.com/wallpaper/575/50/369/simple-background-gradient-abstract-blurred-wallpaper-preview.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                CupertinoSearchTextField(
                  style: TextStyle(color: Colors.white),
                  backgroundColor: const Color.fromARGB(43, 0, 0, 0),
                  controller: searchController,
                  onSubmitted: (String value) {
                    getWeather();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      locationName,
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$regionName, ',
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          countryName,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 150,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          tempC.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 100,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Feels like ${feelsC.toString()}",
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          currentWeather,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ],
                    ),
                    const Text(
                      '°C',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 150,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(45, 0, 0, 0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: const [
                          Icon(
                            Icons.access_time,
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Icon(
                            Icons.air_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Icon(
                            Icons.water_drop_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                        ],
                      ),
                      Column(
                        children: const [
                          Text(
                            'Date & Time :',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            'Wind :',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            'Humidity :',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            localTime,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            '${windSpeedKph.toString()} Km/h',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            '${humidityPercent.toString()} %',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
