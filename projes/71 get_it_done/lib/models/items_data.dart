import 'package:flutter/material.dart';

import 'items.dart';

class ItemData with ChangeNotifier {
  final List<Item> items = [
    Item(
      title: "Peynir al",
    ),
    Item(title: "Ekmek al"),
    Item(title: "Süt al"),
    Item(title: "yoğurt al")
  ];

  void toggleStatus(int index) {
    items[index].toggleStatus();
    notifyListeners();
  }

  void addItem(String title) {
    items.add(Item(title: title));
    notifyListeners();
  }

  void deleteItem(int index) {
    items.removeAt(index);
    notifyListeners();
  }
}
