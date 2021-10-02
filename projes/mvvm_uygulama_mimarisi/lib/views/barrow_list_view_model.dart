import 'package:flutter/cupertino.dart';
import 'package:mvvm_uygulama_mimarisi/models/books_model.dart';
import 'package:mvvm_uygulama_mimarisi/models/borrow_info_model.dart';
import 'package:mvvm_uygulama_mimarisi/services/database.dart';

class BarrowListViewModel with ChangeNotifier {
  Database _database = Database();
  String collectionRef = "Books";

  Future<void> updateBook(
      {required List<BorrowInfo> barrowList, required Books book}) async {
    Books newBook = Books(
        bookName: book.bookName,
        id: book.id,
        authorName: book.authorName,
        publishDate: book.publishDate,
        borrows: barrowList);

    await _database.setBookData(
        collectionRef: collectionRef, bookAsMap: newBook.toMap());
  }
}
