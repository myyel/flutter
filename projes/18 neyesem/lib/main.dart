import 'dart:math';

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

  Random rnd = new Random();

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
                  onPressed: () {
                    CorbaNo = rnd.nextInt(5) + 1;
                  },
                  child: Image.asset("assets/images/corba_$CorbaNo.jpg")),
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
                  onPressed: () {
                    YemekNo = rnd.nextInt(5) + 1;
                  },
                  child: Image.asset("assets/images/yemek_$YemekNo.jpg")),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: FlatButton(
                  onPressed: () {
                    TatliNo = rnd.nextInt(5) + 1;
                  },
                  child: Image.asset("assets/images/tatli_$TatliNo.jpg")),
            ),
          ),
        ],
      ),
    );
  }
}
