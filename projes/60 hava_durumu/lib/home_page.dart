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
  String sehir = "";
  int? sicaklik;
  var woeid;
  String abbr = "c";
  var locationData;
  Position? position;
  List<String> temps = ["", "", "", "", ""];
  List<String> img = [
    "",
    "",
    "",
    "",
    "",
  ];
  List<String> date = [
    "",
    "",
    "",
    "",
    "",
  ];
  List<String> days = [
    "",
    "",
    "",
    "",
    "",
  ];

  Future<void> getDevicePosition() async {
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
    } catch (error) {
      print(error);
    }
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
          tempatureDataParsed["consolidated_weather"][0]["the_temp"].round();
      for (int i = 0; i < 5; i++) {
        temps[i] = tempatureDataParsed["consolidated_weather"][i + 1]
                ["the_temp"]
            .round()
            .toString();
      }

      abbr =
          tempatureDataParsed["consolidated_weather"][0]["weather_state_abbr"];

      for (int i = 0; i < 5; i++) {
        img[i] = tempatureDataParsed["consolidated_weather"][i + 1]
            ["weather_state_abbr"];
      }

      for (int i = 0; i < 5; i++) {
        date[i] = tempatureDataParsed["consolidated_weather"][i + 1]
            ["applicable_date"];
        print(date[0]);
      }
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

  List<DailyWeather> CreatCards() {
    List<DailyWeather> cards = [
      DailyWeather(abbr: "abbr", sicaklik: "sicaklik", tarih: "tarih"),
      DailyWeather(abbr: "abbr", sicaklik: "sicaklik", tarih: "tarih"),
      DailyWeather(abbr: "abbr", sicaklik: "sicaklik", tarih: "tarih"),
      DailyWeather(abbr: "abbr", sicaklik: "sicaklik", tarih: "tarih"),
      DailyWeather(abbr: "abbr", sicaklik: "sicaklik", tarih: "tarih")
    ];

    for (int i = 0; i < img.length; i++) {
      DateTime gun = DateTime.parse(date[i]);
      switch (gun.weekday) {
        case 1:
          days[i] = "Pazartesi";
          break;
        case 2:
          days[i] = "Salı";
          break;
        case 3:
          days[i] = "Çarşamba";
          break;
        case 4:
          days[i] = "Perşembe";
          break;
        case 5:
          days[i] = "Cuma";
          break;
        case 6:
          days[i] = "Cumartesi";
          break;
        case 7:
          days[i] = "Pazar";
          break;
      }
    }

    for (int i = 0; i < img.length; i++) {
      cards[i] = DailyWeather(abbr: img[i], sicaklik: temps[i], tarih: days[i]);
    }

    return cards;
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
                    Container(
                      height: 60,
                      width: 60,
                      child: Image.network(
                          "https://www.metaweather.com/static/img/weather/png/$abbr.png"),
                    ),
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
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .1,
                    ),
                    Container(
                      height: 120,
                      //width: MediaQuery.of(context).size.width * .9,
                      child: FractionallySizedBox(
                        widthFactor: .9,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: CreatCards(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class DailyWeather extends StatelessWidget {
  final String abbr;
  final String sicaklik;
  final String tarih;

  const DailyWeather(
      {required this.abbr, required this.sicaklik, required this.tarih});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.transparent,
      child: Container(
        height: 120,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://www.metaweather.com/static/img/weather/png/$abbr.png",
              height: 50,
              width: 50,
            ),
            Text("$sicaklik° C"),
            Text(tarih),
          ],
        ),
      ),
    );
  }
}
