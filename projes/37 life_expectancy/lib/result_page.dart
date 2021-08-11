import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:life_expectancy/constants.dart';
import 'package:life_expectancy/hesaplama.dart';
import 'package:life_expectancy/userData.dart';

class ResultPage extends StatelessWidget {
  late final UserData _userData;
  ResultPage(this._userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonuç Sayfası"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 10,
            child: Center(
              child: Text(
                Hesap(_userData).hesaplama().toString(),
                style: kTittleText,
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: FlatButton(
                color: Colors.white,
                onPressed: () => {Navigator.pop(context)},
                child: Text(
                  "Geri Dön",
                  style: kTittleText,
                ),
              )),
        ],
      ),
    );
  }
}
