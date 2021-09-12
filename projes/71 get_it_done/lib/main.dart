import 'package:flutter/material.dart';
import 'package:get_it_done/models/items_data.dart';
import 'package:get_it_done/screens/home_page.dart';
import 'package:provider/provider.dart';

import 'models/theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ColorThemeData().createPrefObject();
  await ItemData().createPrefObject();
  runApp(
    MultiProvider(
      child: MyApp(),
      providers: [
        ChangeNotifierProvider<ItemData>(
          create: (BuildContext context) => ItemData(),
        ),
        ChangeNotifierProvider<ColorThemeData>(
          create: (BuildContext context) => ColorThemeData(),
        ),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Provider.of<ColorThemeData>(context).loadThemeFromSharedPref();
    //Provider.of<ItemData>(context).loadItemFromSharedPref();
    return Consumer2<ItemData, ColorThemeData>(
        builder: (context, itemData, colorThemeData, child) {
      itemData.loadItemFromSharedPref();
      colorThemeData.loadThemeFromSharedPref();
      return MaterialApp(
        title: 'Flutter Demo',
        theme: Provider.of<ColorThemeData>(context).selectedThemeData,
        home: HomePage(),
      );
    });
  }
}
