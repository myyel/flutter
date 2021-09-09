import 'package:flutter/material.dart';

import 'items.dart';

class Itemdata with ChangeNotifier {
  final List<Item> items = [
    Item(title: "Peynir al"),
    Item(title: "Ekmek al"),
    Item(title: "Süt al"),
    Item(title: "yoğurt al")
  ];
}
