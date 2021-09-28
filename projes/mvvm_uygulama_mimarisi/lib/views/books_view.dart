import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_uygulama_mimarisi/views/books_view_model.dart';
import 'package:provider/provider.dart';

class BooksView extends StatefulWidget {
  const BooksView({Key? key}) : super(key: key);

  @override
  _BooksViewState createState() => _BooksViewState();
}

class _BooksViewState extends State<BooksView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BooksViewModel>(
      create: (BuildContext context) => BooksViewModel(),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: Text("Cloud Crud İşlemleri"),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                "Veriler",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(),
              StreamBuilder<QuerySnapshot>(
                stream: kitaplarRef.snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> asyncSnapshot) {
                  if (asyncSnapshot.hasError) {
                    return Center(
                      child: Text("bir hata oluştu"),
                    );
                  } else {
                    if (!asyncSnapshot.hasData) {
                      return CircularProgressIndicator();
                    } else {
                      List<DocumentSnapshot> kitaplist =
                          asyncSnapshot.data!.docs;
                      return Flexible(
                        child: ListView.builder(
                            itemCount: kitaplist.length,
                            itemBuilder: (context, index) {
                              return Dismissible(
                                key: UniqueKey(),
                                direction: DismissDirection.endToStart,
                                background: Container(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  color: Colors.red,
                                ),
                                child: Card(
                                  child: ListTile(
                                    title: Text(
                                      kitaplist[index].get("ad"),
                                    ),
                                    subtitle: Text(
                                      kitaplist[index].get("yazar"),
                                    ),
                                  ),
                                ),
                                onDismissed: (_) {
                                  kitaplist[index]
                                      .reference
                                      .update({"sene": FieldValue.delete()});
                                },
                              );
                            }),
                      );
                    }
                  }
                },
              ),
              Divider(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
