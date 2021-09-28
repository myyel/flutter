import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_uygulama_mimarisi/models/books_model.dart';
import 'package:mvvm_uygulama_mimarisi/services/database.dart';

class BooksViewModel extends ChangeNotifier {
  Database _database = Database();
  String _booksRef = "Books";

  /// stream<QuerySnapshot> --> stream<List<DocumentSnapshot>> --> stream<List<Books>> dönüşümü olacak

  Stream<List<Books>> getBookList() {
    /// stream<QuerySnapshot> --> stream<List<DocumentSnapshot>>

    Stream<List<DocumentSnapshot>> streamListDocument = _database
        .getBookListFromApi(_booksRef)
        .map((querySnapshot) => querySnapshot.docs);

    ///stream<List<DocumentSnapshot>> --> stream<List<Books>>

    Stream<List<Books>> streamListBook = streamListDocument.map(
        (listOfDocSnap) => listOfDocSnap
            .map((docSnap) => Books.fromDocument(docSnap))
            .toList());

    return streamListBook;
  }

  Future<void> deleteBook({required Books book}) async {
    await _database.deleteDocument(referencePath: _booksRef, id: book.id);
  }

  ///  bookview'instate bilgisini tutmak
  /// bookview arayüzününihtiyacı olan metodları ve hesaplamaları yapmak
  /// gerekli servislerle konuşmak

}
