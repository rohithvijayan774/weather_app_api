import 'dart:convert';

import 'package:weather_app_sample/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  Future<Weather> getWeatherData(String place) async {
    try {
      final queryParameters = {
        'key': ' 495492bff39a4859afd111058230802',
        'q': place,
      };
      final uri =
          Uri.http('api.weatherapi.com', '/v1/current.json', queryParameters);
      final response = await http.get(uri);
      if (response.statusCode == 200 || response.statusCode <= 299) {
        return Weather.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Can not get weather');
      }
    } catch (e) {
      rethrow;
    }
  }
}
