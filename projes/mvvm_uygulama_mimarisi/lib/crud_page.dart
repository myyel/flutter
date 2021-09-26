import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CrudPage extends StatefulWidget {
  const CrudPage({Key? key}) : super(key: key);

  @override
  _CrudPageState createState() => _CrudPageState();
}

class _CrudPageState extends State<CrudPage> {
  final FirebaseFirestore _database = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final CollectionReference kitaplarRef = _database.collection("Kitaplar");
    final DocumentReference hobbitRef =
        _database.collection("Kitaplar").doc("Hobbit");

    return Scaffold(
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
                    List<DocumentSnapshot> kitaplist = asyncSnapshot.data!.docs;
                    return Flexible(
                      child: ListView.builder(
                          itemCount: kitaplist.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                title: Text(
                                  kitaplist[index].data().toString(),
                                ),
                                subtitle: Text(
                                  kitaplist[index].data().toString(),
                                ),
                              ),
                            );
                          }),
                    );
                  }
                }
              },
            ),
            Divider(),
            Consumer<QuerySnapshot>(
              builder: (context, querysnapshot, child) {
                if (querysnapshot == null) {
                  return CircularProgressIndicator();
                } else {
                  List<DocumentSnapshot> kitaplist = querysnapshot.docs;
                  return Flexible(
                    child: ListView.builder(
                        itemCount: kitaplist.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(
                                kitaplist[index].get("ad").toString(),
                              ),
                              subtitle: Text(
                                kitaplist[index].get("yazar").toString(),
                              ),
                            ),
                          );
                        }),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
