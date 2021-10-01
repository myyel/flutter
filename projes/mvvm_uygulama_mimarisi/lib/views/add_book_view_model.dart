import 'package:flutter/cupertino.dart';
import 'package:mvvm_uygulama_mimarisi/models/books_model.dart';
import 'package:mvvm_uygulama_mimarisi/services/database.dart';
import 'package:mvvm_uygulama_mimarisi/services/time_calculator.dart';

class AddBookViewModel extends ChangeNotifier {
  Database _database = Database();
  String collectionRef = "Books";

  Future<void> addnewBook(
      {required String bookName,
      required String authorName,
      required DateTime publishDate}) async {
    ///Form alanından gelen verilerle bir book objesi oluşturacak

    Books newBook = Books(
      id: DateTime.now().toIso8601String(),
      publishDate: TimeCalculator.dateTimeToTimeStamp(publishDate),
      bookName: bookName,
      authorName: authorName,
      borrows: [],
    );

    ///Bu kitap bilgisini database servisi üzerinden firestore'a yazacak

    await _database.setBookData(
        collectionRef: collectionRef, bookAsMap: newBook.toMap());
  }
}
