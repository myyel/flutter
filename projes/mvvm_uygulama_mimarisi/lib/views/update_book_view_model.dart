import 'package:flutter/cupertino.dart';
import 'package:mvvm_uygulama_mimarisi/models/books_model.dart';
import 'package:mvvm_uygulama_mimarisi/services/database.dart';
import 'package:mvvm_uygulama_mimarisi/services/time_calculator.dart';

class UpdateBookViewModel extends ChangeNotifier {
  Database _database = Database();
  String collectionRef = "Books";

  Future<void> updateNewBook(
      {required String bookName,
      required String authorName,
      required DateTime publishDate,
      required Books book}) async {
    ///Form alanından gelen verilerle bir book objesi oluşturacak

    Books newBook = Books(
        id: book.id,
        publishDate: TimeCalculator.dateTimeToTimeStamp(publishDate),
        bookName: bookName,
        authorName: authorName);

    ///Bu kitap bilgisini database servisi üzerinden firestore'a yazacak

    await _database.setBookData(
        collectionRef: collectionRef, bookAsMap: newBook.toMap());
  }
}
