import 'package:flutter/material.dart';

class ContainerProvider extends ChangeNotifier {
  List<Container> _containers = [];

  List<Container> get containers => _containers;

  void setContainers(List<Container> containers) {
    _containers = containers;
    notifyListeners();
  }
}
