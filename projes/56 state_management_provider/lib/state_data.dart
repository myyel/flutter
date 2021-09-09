import 'package:flutter/cupertino.dart';

class StateData with ChangeNotifier {
  String sehir = "Eskişehir";
  String ilce = "Tepbaşı";
  String mahalle = "Bahçelievler";

  void changeCity(String city) {
    sehir = city;
    notifyListeners();
  }
}
