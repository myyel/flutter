import 'package:flutter/material.dart';
import 'package:mvvm_uygulama_mimarisi/services/time_calculator.dart';
import 'package:mvvm_uygulama_mimarisi/views/add_book_view_model.dart';
import 'package:provider/provider.dart';

class AddBookView extends StatefulWidget {
  const AddBookView({Key? key}) : super(key: key);

  @override
  _AddBookViewState createState() => _AddBookViewState();
}

class _AddBookViewState extends State<AddBookView> {
  TextEditingController bookCtr = TextEditingController();
  TextEditingController authorCtr = TextEditingController();
  TextEditingController publishCtr = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var selectedDate;

  @override
  void dispose() {
    bookCtr.dispose();
    authorCtr.dispose();
    publishCtr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddBookViewModel>(
      create: (_) => AddBookViewModel(),
      builder: (context, _) => Scaffold(
        appBar: AppBar(
          title: Text("Yeni kitap ekle"),
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: bookCtr,
                  decoration: InputDecoration(
                    hintText: "Kitap Adı",
                    icon: Icon(Icons.book),
                  ),
                  validator: (value) {
                    if (value == "" || value!.isEmpty) {
                      return "Kitap adı boş olamaz";
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  controller: authorCtr,
                  decoration: InputDecoration(
                    hintText: "Yazar Adı",
                    icon: Icon(Icons.edit),
                  ),
                  validator: (value) {
                    if (value == "" || value!.isEmpty) {
                      return "Yazar adı boş olamaz";
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  onTap: () async {
                    selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(-1000),
                      lastDate: DateTime.now(),
                    );
                    publishCtr.text =
                        TimeCalculator.dateTimeToString(selectedDate!);
                  },
                  controller: publishCtr,
                  decoration: InputDecoration(
                    hintText: "Yayım Tarihi",
                    icon: Icon(Icons.date_range),
                  ),
                  validator: (value) {
                    if (value == "" || value!.isEmpty) {
                      return "Yayım tarihi boş olamaz";
                    } else {
                      return null;
                    }
                  },
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await Provider.of<AddBookViewModel>(context,
                              listen: false)
                          .addnewBook(
                              bookName: bookCtr.text,
                              authorName: authorCtr.text,
                              publishDate: selectedDate);

                      Navigator.pop(context);
                    }
                  },
                  child: Text("Kaydet"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
