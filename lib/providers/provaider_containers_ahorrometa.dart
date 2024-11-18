import 'package:flutter/material.dart';

class AhorroMetaProvider extends ChangeNotifier {
  bool _mostrarContavalues = false;

  bool get mostrarContavalues => _mostrarContavalues;

  void setMostrarContavalues(bool value) {
    _mostrarContavalues = value;
    notifyListeners();
  }
}
