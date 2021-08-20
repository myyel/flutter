import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hava_durumu/search_page.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String sehir = "Ankara";
  int? sicaklik;
  var woeid;
  String abbr = "c";
  var locationData;
  late Position position;

  Future<void> getDevicePosition() async {
    print(position);
    position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.medium,
    );
    print(position);
  }

  Future<void> getLocationDataLatLong() async {
    var urlSehir = Uri.parse(
        "https://www.metaweather.com/api/location/search/?lattlong=${position!.latitude},${position!.longitude}");
    locationData = await http.get(urlSehir);
    var locationDataParsed = jsonDecode(locationData.body);
    woeid = locationDataParsed[0]["woeid"];
    sehir = locationDataParsed[0]["title"];
  }

  Future<void> getLocationData() async {
    var urlSehir = Uri.parse(
        "https://www.metaweather.com/api/location/search/?query=$sehir");
    locationData = await http.get(urlSehir);
    var locationDataParsed = jsonDecode(locationData.body);
    woeid = locationDataParsed[0]["woeid"];
  }

  Future<void> getLocationTempature() async {
    var response = await http
        .get(Uri.parse("https://www.metaweather.com/api/location/$woeid/"));

    var tempatureDataParsed = jsonDecode(response.body);

    setState(() {
      sicaklik =
          tempatureDataParsed["consolidated_weather"][2]["the_temp"].round();
      abbr =
          tempatureDataParsed["consolidated_weather"][1]["weather_state_abbr"];
    });
  }

  Future<void> getDataFromAPI() async {
    await getDevicePosition();
    await getLocationDataLatLong();
    getLocationTempature();
  }

  Future<void> getDataFromAPIbyCity() async {
    await getLocationData();
    getLocationTempature();
  }

  @override
  void initState() {
    getDataFromAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/$abbr.jpg"),
        ),
      ),
      child: sicaklik == null || abbr == ""
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
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
                        shadows: <Shadow>[
                          Shadow(
                            color: Colors.black38,
                            blurRadius: 5,
                            offset: Offset(-3, 3),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          sehir,
                          style: TextStyle(
                            fontSize: 30,
                            shadows: <Shadow>[
                              Shadow(
                                color: Colors.black38,
                                blurRadius: 5,
                                offset: Offset(-3, 3),
                              )
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            sehir = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchPage(),
                              ),
                            );
                            getDataFromAPIbyCity();
                            setState(() {
                              sehir = sehir;
                            });
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
