import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? secilenSehir;
  final myController = TextEditingController();
  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Yanlış Şehir seçimi"),
            content: Text("Başka bir şehir seçiniz"),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Kapat"),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/search.jpg"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Şehir seçin"),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(75),
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(hintText: "Şehir"),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                  /*onChanged: (value) {
                    secilenSehir = value;
                    print(secilenSehir);
                  }*/
                  controller: myController,
                ),
              ),
              FlatButton(
                  onPressed: () async {
                    String sehir = myController.text;
                    var urlSehir = Uri.parse(
                        "https://www.metaweather.com/api/location/search/?query=$sehir");
                    var locationData = await http.get(urlSehir);
                    jsonDecode(locationData.body).isEmpty
                        ? _showDialog()
                        : Navigator.pop(context, sehir);
                  },
                  child: Text("Şehir seç"))
            ],
          ),
        ),
      ),
    );
  }
}
