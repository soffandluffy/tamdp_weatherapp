import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/models/weather_model.dart';

class WeatherService {
  String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<List<Weather>> getWeatherDetail(int id) async {
    var url = Uri.parse(baseUrl);
    var headers = {'Content-Type': 'application/json'};
    var params = {
      'id': id.toString(),
      'units': 'metric',
      'appid': 'b08cdccb72e92cb382da75a24e4b6c4f'
    };
    final newUrl = url.replace(queryParameters: params);
    var response = await http.get(newUrl, headers: headers);

    try {
      if (response.statusCode == 200) {
        List data = jsonDecode("[" + response.body + "]");
        List<Weather> weathers = [];
        for (var item in data) {
          weathers.add(Weather.fromJson(item));
        }

        return weathers;
      } else {
        throw Exception('Failed getting current weather');
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
