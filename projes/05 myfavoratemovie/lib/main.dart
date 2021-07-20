import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.brown[500],
          centerTitle: true,
          title: Text("Favori Filmim"),
        ),
        body: Center(
          child: Image.asset("images/movie.jpg"),
        ),
      ),
    ),
  );
}
