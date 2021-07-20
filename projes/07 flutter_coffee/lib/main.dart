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
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.white,
                //width: double.infinity,
                height: 100,
                margin: EdgeInsets.only(top: 2),
                child: Center(
                  child: Text("1. kontainer"),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                //width: 200,
                height: 100,
                color: Colors.pinkAccent,
                margin: EdgeInsets.only(top: 2),
                child: Center(
                  child: Text("2. kontainer"),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                //width: 200,
                height: 100,
                color: Colors.lightBlue,
                margin: EdgeInsets.only(top: 2),
                child: Center(
                  child: Text("3. kontainer"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    color: Colors.white,
                    //width: double.infinity,
                    height: 100,
                    margin: EdgeInsets.only(top: 20),
                    child: Center(
                      child: Text("1. kontainer"),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    //width: 200,
                    height: 100,
                    color: Colors.pinkAccent,
                    margin: EdgeInsets.only(top: 20),
                    child: Center(
                      child: Text("2. kontainer"),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    //width: 200,
                    height: 100,
                    color: Colors.lightBlue,
                    margin: EdgeInsets.only(top: 20),
                    child: Center(
                      child: Text("3. kontainer"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
