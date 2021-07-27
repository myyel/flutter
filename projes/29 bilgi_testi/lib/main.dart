import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constant.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  int i = 0;
  String soru = "Bilgi Testi Soruları";
  List<Widget> sayac = [];
  List<String> sorular = [
    "Titanic gelmiş geçmiş en büyük gemidir",
    "Dünyadaki tavuk sayısı insan sayısından fazladır",
    "Kelebeklerin ömrü bir gündür",
    "Dünya düzdür",
    "Kaju fıstığı aslında bir meyvenin sapıdır",
    "Fatih Sultan Mehmet hiç patates yememiştir",
    "Fransızlar 80 demek için, 4 - 20 der",
    "Sorular bitmiştir"
  ];

  void sorugoster() {
    if (i == 8) {
      i = 0;
      soru = "Bilgi Testi Soruları";
      sayac.clear();
    }
    soru = sorular[i];
    i++;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                soru,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          direction: Axis.horizontal,
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.end,
          children: sayac,
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.red[400],
                          child: Icon(
                            Icons.thumb_down,
                            size: 30.0,
                          ),
                          onPressed: () {
                            setState(() {
                              sorugoster();
                              sayac.add(kYanlis);
                            });
                          },
                        ))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.green[400],
                          child: Icon(Icons.thumb_up, size: 30.0),
                          onPressed: () {
                            setState(() {
                              sorugoster();
                              sayac.add(kDogru);
                            });
                          },
                        ))),
              ])),
        )
      ],
    );
  }
}
