import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(NeYesem());
}

class NeYesem extends StatelessWidget {
  const NeYesem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Bugün Ne Yesem?",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
        ),
        body: YemekSayfasi(),
      ),
    );
  }
}

class YemekSayfasi extends StatefulWidget {
  @override
  _YemekSayfasiState createState() => _YemekSayfasiState();
}

class _YemekSayfasiState extends State<YemekSayfasi> {
  int CorbaNo = 1;
  int YemekNo = 1;
  int TatliNo = 1;
  List<String> corbaName = [
    "Mercimek Çorbası",
    "Tarhana Çorbası",
    "Tavuk suyu Çorba",
    "Düğün Çorbası",
    "Yoğurtlu Çorba"
  ];

  List<String> yemekName = [
    "Karnıyarık",
    "Mantı",
    "Kuru Fasulye",
    "İçli Köfte",
    "Izgara Balık"
  ];

  List<String> tatliName = [
    "Kadayıf",
    "Baklava",
    "Sütlaç",
    "Kazandibi",
    "Dondurma"
  ];

  Random rnd = new Random();

  void ChangeFood() {
    setState(() {
      CorbaNo = rnd.nextInt(5) + 1;
      YemekNo = rnd.nextInt(5) + 1;
      TatliNo = rnd.nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                  onPressed: ChangeFood,
                  child: Image.asset("assets/images/corba_$CorbaNo.jpg")),
            ),
          ),
          Text(
            corbaName[CorbaNo - 1],
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Container(
            width: 200,
            child: Divider(
              height: 5,
              color: Colors.black,
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: FlatButton(
                  color: Colors.black,
                  highlightColor: Colors.pinkAccent,
                  splashColor: Colors.green,
                  onPressed: ChangeFood,
                  child: Image.asset("assets/images/yemek_$YemekNo.jpg")),
            ),
          ),
          Text(
            yemekName[YemekNo - 1],
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Container(
            width: 200,
            child: Divider(
              height: 5,
              color: Colors.black,
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: FlatButton(
                  onPressed: ChangeFood,
                  child: Image.asset("assets/images/tatli_$TatliNo.jpg")),
            ),
          ),
          Text(
            tatliName[TatliNo - 1],
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Container(
            width: 200,
            child: Divider(
              height: 5,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
