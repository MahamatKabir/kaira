import 'package:flutter/material.dart';
import 'package:kaira/models/city_model.dart';

class CityProvider extends ChangeNotifier {
  List<City> _cities = [];

  List<City> get cities => _cities;

  void setCities(List<City> cities) {
    _cities = cities;
    notifyListeners();
  }
}
