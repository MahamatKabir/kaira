import 'package:flutter/material.dart';
import 'package:kaira/models/containertype_model.dart';

class ContainerTypeProvider extends ChangeNotifier {
  List<ContainerType> _containerTypes = [];

  List<ContainerType> get containerTypes => _containerTypes;

  void setContainerTypes(List<ContainerType> containerTypes) {
    _containerTypes = containerTypes;
    notifyListeners();
  }
}
