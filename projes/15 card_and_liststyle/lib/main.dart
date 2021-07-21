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
                ),
                Container(
                  width: 200,
                  child: Divider(
                    height: 20,
                    color: Colors.brown[900],
                  ),
                ),
                Card(
                  color: Colors.brown[900],
                  margin: EdgeInsets.fromLTRB(45, 20, 45, 20),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.email,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "sipariş@yellioğullari.com",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.brown[900],
                  margin: EdgeInsets.fromLTRB(45, 0, 45, 20),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    title: Text(
                      "+90 (544) 295 19 87",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
