import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/models/location_model.dart';

class LocationService {
  String baseUrl =
      'https://my-json-server.typicode.com/soffandluffy/tamdp_weatherapp/location';

  Future<List<Location>> getLocation() async {
    var url = Uri.parse(baseUrl);
    var headers = {'Content-Type': 'application/json'};
    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      List<Location> locations = [];
      for (var item in data) {
        locations.add(Location.fromJson(item));
      }

      return locations;
    } else {
      throw Exception('Failed getting locations');
    }
  }
}
