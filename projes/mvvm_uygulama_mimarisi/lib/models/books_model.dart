import 'package:cloud_firestore/cloud_firestore.dart';

class Books {
  final String id;
  final String bookName;
  final String authorName;
  final Timestamp publishDate;

  Books(
      {required this.id,
      required this.bookName,
      required this.authorName,
      required this.publishDate});

  /// objeden Map oluşturan method

  Map<String, dynamic> toMap() => {
        "id": id,
        "bookName": bookName,
        "authorName": authorName,
        "publishDate": publishDate
      };

  ///mapTen obje oluşturan yapıcı
  ///
  factory Books.fromMap(Map map) => Books(
        id: map["id"],
        bookName: map["bookName"],
        authorName: map["authorName"],
        publishDate: map["publishDate"],
      );

  factory Books.fromDocument(DocumentSnapshot map) => Books(
      id: map.get("id"),
      bookName: map.get("bookName"),
      authorName: map.get("authorName"),
      publishDate: map.get("publishDate"));
}
