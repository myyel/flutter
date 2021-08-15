import 'package:flutter/cupertino.dart';

class StateData with ChangeNotifier {
  String sehir = "Eskişehir";

  void changeCity(String city) {
    sehir = city;
    notifyListeners();
  }
}
