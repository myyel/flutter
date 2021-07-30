import 'soru.dart';

class TestVeri {
  List<SoruObject> _SoruBankasi = [
    SoruObject(soru: "Titanic gelmiş geçmiş en büyük gemidir", yanit: false),
    SoruObject(
        soru: "Dünyadaki tavuk sayısı insan sayısından fazladır", yanit: true),
    SoruObject(soru: "Kelebeklerin ömrü bir gündür", yanit: false),
    SoruObject(soru: "Dünya düzdür", yanit: false),
    SoruObject(soru: "Kaju fıstığı aslında bir meyvenin sapıdır", yanit: true),
    SoruObject(soru: "Fatih Sultan Mehmet hiç patates yememiştir", yanit: true),
    SoruObject(soru: "Fransızlar 80 demek için, 4 - 20 der", yanit: true),
    SoruObject(soru: "Sorular bitmiştir", yanit: true),
  ];

  String getSoru(int soruIndex) {
    if (soruIndex < 0 ||
        soruIndex >= _SoruBankasi.length ||
        soruIndex == null) {
      soruIndex = 0;
    }
    return _SoruBankasi[soruIndex].soru;
  }

  bool getYanit(int soruIndex) {
    if (soruIndex < 0 && soruIndex >= _SoruBankasi.length ||
        soruIndex == null) {
      soruIndex = 0;
    }
    return _SoruBankasi[soruIndex].yanit;
  }

  bool testBittiMi(int soruIndex) {
    if (soruIndex >= _SoruBankasi.length) {
      return true;
    } else {
      return false;
    }
  }
}
