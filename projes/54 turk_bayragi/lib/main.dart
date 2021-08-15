import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TurkBayragi(G: 200),
        ],
      ),
    );
  }
}

class TurkBayragi extends StatelessWidget {
  double G;
  TurkBayragi({required this.G});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 1.5 * G,
            height: G,
            color: Colors.red,
          ),
          Positioned(
            top: .25 * G,
            left: .25 * G,
            child: CircleAvatar(
              radius: 0.25 * G,
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            top: .3 * G,
            left: 0.3625 * G,
            child: CircleAvatar(
              radius: 0.2 * G,
              backgroundColor: Colors.red,
            ),
          ),
          Positioned(
            left: .85 * G,
            top: .325 * G,
            child: Container(
              transform: Matrix4.rotationZ(1),
              child: Icon(
                Icons.star,
                size: .25 * G,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
