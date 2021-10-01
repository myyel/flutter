import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mvvm_uygulama_mimarisi/models/borrow_info_model.dart';

class Books {
  final String id;
  final String bookName;
  final String authorName;
  final Timestamp publishDate;
  final List<BorrowInfo> borrows;

  Books(
      {required this.id,
      required this.bookName,
      required this.authorName,
      required this.publishDate,
      required this.borrows});

  /// objeden Map oluşturan method

  Map<String, dynamic> toMap() {
    /// List<BorrowInfo> 'yu List<Map> ' e dönüştürecek bir yapı oluşturulacak

    List<Map<String, dynamic>> borrows =
        this.borrows.map((borrowInfo) => borrowInfo.toMap()).toList();

    return {
      "id": id,
      "bookName": bookName,
      "authorName": authorName,
      "publishDate": publishDate,
      "borrows": borrows
    };
  }

  ///mapTen obje oluşturan yapıcı
  ///
  factory Books.fromMap(Map map) {
    var borrowListAsMap = map["borrows"] as List;
    List<BorrowInfo> borrows = borrowListAsMap
        .map((borrowAsMap) => BorrowInfo.fromMap(borrowAsMap))
        .toList();

    return Books(
      id: map["id"],
      bookName: map["bookName"],
      authorName: map["authorName"],
      publishDate: map["publishDate"],
      borrows: borrows,
    );
  }

  factory Books.fromDocument(DocumentSnapshot map) {
    var borrowListAsMap = map["borrows"] as List;
    List<BorrowInfo> borrows = borrowListAsMap
        .map((borrowAsMap) => BorrowInfo.fromMap(borrowAsMap))
        .toList();

    return Books(
        id: map.get("id"),
        bookName: map.get("bookName"),
        authorName: map.get("authorName"),
        publishDate: map.get("publishDate"),
        borrows: borrows);
  }
}
