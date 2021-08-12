import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StackLesson(),
    );
  }
}

class StackLesson extends StatelessWidget {
  const StackLesson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        height: 350,
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          alignment: Alignment.bottomCenter,
          children: [
            maviKutu,
            Positioned(
              child: pinkKutu,
              top: 30,
              right: 30,
            ),
            Positioned(
              bottom: -20,
              left: 20,
              child: yildiz,
            )
          ],
        ),
      ),
    );
  }
}

Widget maviKutu = Container(
  height: 200,
  width: 200,
  color: Colors.blue,
);
Widget pinkKutu = Container(
  height: 100,
  width: 300,
  color: Colors.pink,
);

Widget yildiz = Icon(Icons.star, size: 50, color: Colors.yellow);
