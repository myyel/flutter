import 'package:flutter/material.dart';
import 'package:mvvm_uygulama_mimarisi/models/books_model.dart';

class BarrowListView extends StatefulWidget {
  late Books book;
  BarrowListView({required this.book});

  @override
  _BarrowListViewState createState() => _BarrowListViewState();
}

class _BarrowListViewState extends State<BarrowListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kayıt Listesi"),
      ),
    );
  }
}
