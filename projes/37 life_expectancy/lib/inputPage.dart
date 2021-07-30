import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'myWidgets.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String seciliButon = "";

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
                  child: MyContainer(),
                ),
                Expanded(
                  child: MyContainer(),
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
}
