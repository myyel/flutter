import 'package:life_expectancy/userData.dart';

class Hesap {
  UserData _userData;

  Hesap(this._userData);

  int hesaplama() {
    int sonuc;

    sonuc = 90 + _userData.spor.round() - _userData.sigara.round();
    sonuc = (sonuc + (_userData.boy / _userData.kilo).round());

    if (_userData.seciliButon == "KADIN") {
      return sonuc + 3;
    } else {
      return sonuc;
    }
  }
}
