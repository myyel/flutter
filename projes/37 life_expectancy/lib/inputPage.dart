import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expectancy/constants.dart';
import 'package:life_expectancy/result_page.dart';
import 'package:life_expectancy/userData.dart';

import 'myWidgets.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  UserData _userData =
      UserData(sigara: 15, seciliButon: "", spor: 3, boy: 170, kilo: 60);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton("BOY"),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton("KİLO"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Haftada kaç gün spor yapıyorsunuz?",
                    style: kTittleText,
                  ),
                  Text(
                    _userData.spor.round().toString(),
                    style: kContentText,
                  ),
                  Slider(
                    min: 0,
                    max: 7,
                    value: _userData.spor,
                    onChanged: (double _newCigarette) {
                      setState(() {
                        _userData.spor = _newCigarette;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Günde kaç tane sigara içiyorsunuz?",
                  style: kTittleText,
                ),
                Text(
                  _userData.sigara.round().toString(),
                  style: kContentText,
                ),
                Slider(
                  min: 0,
                  max: 40,
                  value: _userData.sigara,
                  onChanged: (double _newCigarette) {
                    setState(() {
                      _userData.sigara = _newCigarette;
                    });
                  },
                ),
              ],
            )),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        _userData.seciliButon = "KADIN";
                      });
                    },
                    renk: _userData.seciliButon == "KADIN"
                        ? Colors.grey
                        : Colors.white,
                    child: IconCinsiyet(
                      fontIcon: FontAwesomeIcons.venus,
                      yazi: "KADIN",
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        _userData.seciliButon = "ERKEK";
                      });
                    },
                    renk: _userData.seciliButon == "ERKEK"
                        ? Colors.grey
                        : Colors.white,
                    child: IconCinsiyet(
                      fontIcon: FontAwesomeIcons.mars,
                      yazi: "ERKEK",
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtonTheme(
            height: 50,
            child: FlatButton(
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(_userData)))
              },
              child: Text(
                "HESAPLA",
                style: kTittleText,
              ),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Row buildRowOutlineButton(String yazi) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            yazi,
            style: kTittleText,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            yazi == "BOY"
                ? _userData.boy.toString()
                : _userData.kilo.toString(),
            style: kContentText,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              height: 36,
              minWidth: 36,
              child: OutlineButton(
                borderSide: BorderSide(
                  color: Colors.lightBlue,
                ),
                onPressed: () => {
                  setState(() {
                    yazi == "BOY" ? _userData.boy++ : _userData.kilo++;
                  })
                },
                child: Icon(
                  FontAwesomeIcons.plus,
                  size: 10,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ButtonTheme(
              height: 36,
              minWidth: 36,
              child: OutlineButton(
                borderSide: BorderSide(
                  color: Colors.lightBlue,
                ),
                onPressed: () => {
                  setState(() {
                    yazi == "BOY" ? _userData.boy-- : _userData.kilo--;
                  })
                },
                child: Icon(
                  FontAwesomeIcons.minus,
                  size: 10,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
