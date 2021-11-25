import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/models/weekly_model.dart';

class WeeklyService {
  String baseUrl = 'https://api.openweathermap.org/data/2.5/onecall';

  Future<List<Weekly>> getWeeklyDetail(double lat, double lon) async {
    var url = Uri.parse(baseUrl);
    var headers = {'Content-Type': 'application/json'};
    var params = {
      'lat': lat.toString(),
      'lon': lon.toString(),
      'exclude': 'current,minutely,hourly,alerts',
      'units': 'metric',
      'appid': 'b08cdccb72e92cb382da75a24e4b6c4f'
    };
    final newUrl = url.replace(queryParameters: params);
    var response = await http.get(newUrl, headers: headers);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)["daily"];
      print(data.toString());
      List<Weekly> weeklies = [];
      for (var item in data) {
        weeklies.add(Weekly.fromJson(item));
      }
      print("success");

      return weeklies;
    } else {
      throw Exception('Failed getting weekly forecast');
    }
  }
}
