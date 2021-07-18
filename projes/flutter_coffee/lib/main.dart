import 'package:flutter/material.dart';

void main() {
  runApp(
    BenimUyg(),
  );
}

class BenimUyg extends StatelessWidget {
  const BenimUyg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lime,
        body: SafeArea(
          //Cihazda uygunsuz bir yer pozisyonlanmasını engelleyen widget
          child: Container(
            width: 200, // GEnişlik verme property
            height: 100, // yükseklik verme property
            alignment:
                Alignment.bottomRight, // Container içinde yer hizalama property
            decoration: BoxDecoration(
              // Container'ın şeklini düzenleme widget
              shape: BoxShape
                  .rectangle, // shape property BoxShape ile şekil veriyor
              borderRadius: BorderRadius.circular(
                  16), // borderRadius property, BorderRadius widget ile kenarlara radius veriyor
              color: Colors.white,
            ),
            margin: EdgeInsets.only(
                left: 100,
                right: 150,
                top: 250,
                bottom: 250), //margin property EdgeInsets ile margin uyguluyor
            padding: EdgeInsets.all(
                16), //padding property EdgeInsets ile padding uyguluyor
            child: Transform(
              //Transform Widget, nesneleri döndürmeye yarıyor
              transform: Matrix4.rotationZ(-0.2),
              alignment: FractionalOffset.center,
              child: Text("Mehmet Yel"),
            ),
          ),
        ),
      ),
    );
  }
}
