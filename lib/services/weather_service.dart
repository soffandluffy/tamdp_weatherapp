import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/models/weather_model.dart';

class WeatherService {
  String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<List<Weather>> getWeatherDetail(String id) async {
    var url = Uri.parse(baseUrl);
    var headers = {'Content-Type': 'application/json'};
    var params = {
      'id': id,
      'units': 'metric',
      'appid': 'b08cdccb72e92cb382da75a24e4b6c4f'
    };
    final newUrl = url.replace(queryParameters: params);
    var response = await http.get(newUrl, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      print("data");
      List<Weather> products = [];
      for (var item in data) {
        print("for");
        products.add(Weather.fromJson(item));
      }
      print("berhasil");

      return products;
    } else {
      throw Exception('Failed getting products');
    }
  }
}
