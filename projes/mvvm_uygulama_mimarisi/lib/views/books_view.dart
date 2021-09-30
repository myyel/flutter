import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mvvm_uygulama_mimarisi/models/books_model.dart';
import 'package:mvvm_uygulama_mimarisi/views/add_book_view.dart';
import 'package:mvvm_uygulama_mimarisi/views/update_book_view.dart';
import 'package:provider/provider.dart';

import 'books_view_model.dart';

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
        backgroundColor: Colors.grey[200],
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
              StreamBuilder<List<Books>>(
                stream: Provider.of<BooksViewModel>(context, listen: false)
                    .getBookList(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Books>> asyncSnapshot) {
                  if (asyncSnapshot.hasError) {
                    print(asyncSnapshot);
                    return Center(
                      child: Text("bir hata oluştu"),
                    );
                  } else {
                    if (!asyncSnapshot.hasData) {
                      return CircularProgressIndicator();
                    } else {
                      List<Books>? kitaplist = asyncSnapshot.data;
                      return BuildListView(kitaplist: kitaplist);
                    }
                  }
                },
              ),
              Divider(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddBookView()));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class BuildListView extends StatefulWidget {
  const BuildListView({
    Key? key,
    required this.kitaplist,
  }) : super(key: key);

  final List<Books>? kitaplist;

  @override
  _BuildListViewState createState() => _BuildListViewState();
}

class _BuildListViewState extends State<BuildListView> {
  bool isFiltering = false;
  late List<Books> filteredList;

  @override
  Widget build(BuildContext context) {
    var fullList = widget.kitaplist;
    return Flexible(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Arama kitap adı",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  isFiltering = true;
                  setState(() {
                    filteredList = fullList!
                        .where((book) => book.bookName
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();
                  });
                } else {
                  setState(() {
                    WidgetsBinding.instance!.focusManager.primaryFocus!
                        .unfocus();
                    isFiltering = false;
                  });
                }
              },
            ),
          ),
          Flexible(
            child: ListView.builder(
                itemCount: isFiltering ? filteredList.length : fullList!.length,
                itemBuilder: (context, index) {
                  var list = isFiltering ? filteredList : fullList;
                  return Slidable(
                    child: Card(
                      child: ListTile(
                        title: Text(
                          list![index].bookName,
                        ),
                        subtitle: Text(
                          list![index].authorName,
                        ),
                      ),
                    ),
                    actionPane: SlidableScrollActionPane(),
                    actionExtentRatio: .15,
                    secondaryActions: [
                      IconSlideAction(
                        caption: 'Düzenle',
                        color: Colors.orange,
                        icon: Icons.edit,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UpdateBookView(
                                book: list[index],
                              ),
                            ),
                          );
                        },
                      ),
                      IconSlideAction(
                        caption: 'Sil',
                        color: Colors.red,
                        icon: Icons.delete,
                        onTap: () async {
                          await Provider.of<BooksViewModel>(context,
                                  listen: false)
                              .deleteBook(book: list[index]);
                        },
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
