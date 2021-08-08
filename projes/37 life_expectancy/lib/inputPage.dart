import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expectancy/constants.dart';

import 'myWidgets.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String seciliButon = "";
  int boy = 170;
  int kilo = 60;

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
              child: SliderColumn(
                degerMax: 7,
                degerMin: 0,
                soru: "Haftada kaç gün spor yapıyorsunuz?",
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: SliderColumn(
                degerMax: 40,
                degerMin: 0,
                soru: "Günde kaç tane sigara içiyorsunuz?",
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliButon = "KADIN";
                      });
                    },
                    renk: seciliButon == "KADIN" ? Colors.grey : Colors.white,
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
                        seciliButon = "ERKEK";
                      });
                    },
                    renk: seciliButon == "ERKEK" ? Colors.grey : Colors.white,
                    child: IconCinsiyet(
                      fontIcon: FontAwesomeIcons.mars,
                      yazi: "ERKEK",
                    ),
                  ),
                ),
              ],
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
            yazi == "BOY" ? boy.toString() : kilo.toString(),
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
                    yazi == "BOY" ? boy++ : kilo++;
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
                    yazi == "BOY" ? boy-- : kilo--;
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
