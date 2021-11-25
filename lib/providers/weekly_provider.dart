import 'package:flutter/cupertino.dart';
import 'package:weatherapp/models/weekly_model.dart';
import 'package:weatherapp/services/weekly_service.dart';

class WeeklyProvider with ChangeNotifier {
  List<Weekly> _weeklies = [];
  List<Weekly> get weeklies => _weeklies;
  set weeklies(List<Weekly> weeklies) {
    _weeklies = weeklies;
    notifyListeners();
  }

  Future<List<Weekly>> getWeeklyDetail(double lat, double lon) async {
    try {
      List<Weekly> weeklies = await WeeklyService().getWeeklyDetail(lat, lon);
      _weeklies = weeklies;
      return weeklies;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
