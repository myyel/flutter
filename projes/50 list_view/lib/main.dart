import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
      home: ListViewPage(),
    );
  }
}

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPage createState() => _ListViewPage();
}

class _ListViewPage extends State<ListViewPage> {
  var listItem = [
    ListTile(
      tileColor: Colors.lightBlue,
      title: Text("1. Öğe"),
    ),
    ListTile(
      tileColor: Colors.yellow,
      title: Text("2. Öğe"),
    ),
    ListTile(
      tileColor: Colors.red,
      title: Text("3. Öğe"),
    ),
  ];

  List<String> names = ["ali", "mehmet", "ismet", "haşim"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Center(
          child: Text("ListView Demo"),
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: FractionallySizedBox(
          widthFactor: 0.8,
          heightFactor: 0.3,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return VerticalDivider(
                width: 20,
                color: Colors.pink,
              );
            },
            itemCount: names.length,
            itemBuilder: (context, index) {
              var containers = names
                  .map(
                    (name) => Container(
                      width: 100,
                      height: 100,
                      color: Colors.lightBlue,
                      child: Text(name),
                    ),
                  )
                  .toList();

              return containers[index];
            },
          ),
        ),
      ),
    );
  }
}
