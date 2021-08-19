import 'dart:convert';

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
  double? sicaklik;
  var woeid;
  var urlSehir = Uri.parse(
      "https://www.metaweather.com/api/location/search/?query=ankara");

  var locationData;
  Future<void> getLocationData() async {
    locationData = await http.get(urlSehir);
    var locationDataParsed = jsonDecode(locationData.body);
    woeid = locationDataParsed[0]["woeid"];
  }

  Future<void> getLocationTempature() async {
    var response = await http
        .get(Uri.parse("https://www.metaweather.com/api/location/$woeid/"));

    var tempatureDataParsed = jsonDecode(response.body);
    sicaklik = tempatureDataParsed["consolidated_weather"][2]["the_temp"];
  }

  void getDataFromAPI() async {
    await getLocationData();
    getLocationTempature();
  }

  @override
  void initState() {
    getDataFromAPI();
    print(woeid);
    super.initState();
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
