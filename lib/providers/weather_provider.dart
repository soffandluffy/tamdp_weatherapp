import 'package:flutter/cupertino.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_service.dart';

class WeatherProvider with ChangeNotifier {
  List<Weather> _weathers = [];
  List<Weather> get weathers => _weathers;
  set weathers(List<Weather> weathers) {
    _weathers = weathers;
    notifyListeners();
  }

  Future<List<Weather>> getWeatherDetail(int id) async {
    try {
      List<Weather> weathers = await WeatherService().getWeatherDetail(id);
      _weathers = weathers;
      return weathers;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
