import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  TextEditingController _controller = TextEditingController();
  var GIFData;

  List<String> GIFs = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  Future<void> getGIF(String word) async {
    var urlEx = Uri.parse(
        "https://g.tenor.com/v1/search?q=$word&key=LIVDSRZULELA&limit=8");

    GIFData = await http.get(urlEx);

    var GIFDataParsed = jsonDecode(GIFData.body);
    for (int i = 0; i < GIFs.length; i++) {
      GIFs[i] = GIFDataParsed["results"][i]["media"][0]["tinygif"]["url"];
    }

    setState(() {});
  }

  void initState() {
    getGIF("excited");
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Center(
          child: Text(
            "Tenor GIF API",
            style: TextStyle(
              color: Colors.black38,
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    hintText: "GIF bul",
                  ),
                ),
              ),
              FlatButton(
                color: Colors.red,
                onPressed: () {
                  getGIF(_controller.text);
                },
                child: Text("Gif Getir"),
              ),
              GIFs[7] == ""
                  ? CircularProgressIndicator()
                  : Container(
                      height: MediaQuery.of(context).size.height * .7,
                      child: ListView.separated(
                          itemBuilder: (_, int index) {
                            return Img(GIFs[index]);
                          },
                          separatorBuilder: (_, __) {
                            return Divider(
                              height: 5,
                              thickness: 5,
                              color: Colors.blueGrey,
                            );
                          },
                          itemCount: GIFs.length),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class Img extends StatelessWidget {
  final String gif;

  Img(this.gif);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        gif,
        fit: BoxFit.cover,
      ),
    );
  }
}
