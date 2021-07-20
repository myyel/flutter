import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffD7E0ff),
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[800],
          title: Center(
            child: Text(
              "Mutlu Bayramlar",
            ),
          ),
        ),
        body: Center(
          child: Image.asset(
            'images/mutlu_bayramlar.jpg',
          ),
        ),
      ),
    ),
  );
}
