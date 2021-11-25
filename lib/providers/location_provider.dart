import 'package:flutter/cupertino.dart';
import 'package:weatherapp/models/location_model.dart';
import 'package:weatherapp/services/location_service.dart';

class LocationProvider with ChangeNotifier {
  List<Location> _locations = [];
  List<Location> get locations => _locations;
  set locations(List<Location> locations) {
    _locations = locations;
    notifyListeners();
  }

  Future<List<Location>> getlocation() async {
    try {
      List<Location> locations = await LocationService().getLocation();
      _locations = locations;
      return locations;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
