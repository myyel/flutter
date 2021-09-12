import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'items.dart';

class ItemData with ChangeNotifier {
  final List<Item> items = [];

  static late SharedPreferences _sharedPreferences;

  List<String> _itemsAsString = [];

  void toggleStatus(int index) {
    items[index].toggleStatus();
    saveItemsToSharedPref(items);
    notifyListeners();
  }

  void addItem(String title) {
    items.add(Item(title: title));
    saveItemsToSharedPref(items);
    notifyListeners();
  }

  void deleteItem(int index) {
    items.removeAt(index);
    saveItemsToSharedPref(items);
    notifyListeners();
  }

  Future<void> createPrefObject() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void saveItemsToSharedPref(List<Item> items) {
    _itemsAsString.clear();

    for (var item in items) {
      _itemsAsString.add(json.encode(item.toMap()));
    }
    _sharedPreferences.setStringList("toDoData", _itemsAsString);
  }

  void loadItemFromSharedPref() {
    List<String> tempList = _sharedPreferences.getStringList("toDoData") ?? [];
    if (tempList.isNotEmpty) {
      items.clear();
      for (var item in tempList) {
        items.add(Item.fromMap(json.decode(item)));
      }
    }
  }
}
