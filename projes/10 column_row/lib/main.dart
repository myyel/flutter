import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 100,
              color: Colors.white,
              child: Center(
                child: Text("1.Container"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.deepOrangeAccent,
                  child: Center(
                    child: Text("2. Container"),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.yellow,
                  child: Center(
                    child: Text("2. Container"),
                  ),
                ),
              ],
            ),
            Container(
              height: 100,
              color: Colors.blueAccent,
              child: Center(
                child: Text("3.Container"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
