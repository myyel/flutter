import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hava_durumu/search_page.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String sehir = "Ankara";
  int sicaklik = 20;
  var urlSehir = Uri.parse(
      "https://www.metaweather.com/api/location/search/?query=ankara");
  var locationData;
  void getLocationData() async {
    locationData = await http.get(urlSehir);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/c.jpg"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                onPressed: () {
                  getLocationData();
                  Future.delayed(Duration(seconds: 1), () {
                    print("konum: $locationData");
                  });
                },
                child: Text("konum al"),
                color: Colors.grey,
              ),
              Text(
                "$sicaklik° C",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 70,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    sehir,
                    style: TextStyle(fontSize: 30),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchPage()),
                      );
                    },
                    icon: Icon(Icons.search),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
