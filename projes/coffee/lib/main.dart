import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Arial"),
      home: Scaffold(
        backgroundColor: Colors.brown[300],
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.lime,
                  backgroundImage: AssetImage("assets/images/index.png"),
                ),
                Text(
                  "Yellioğulları Kahvecisi",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.brown[900],
                    fontFamily: "DancingScript",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Bir Fincan Uzağınızda",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
