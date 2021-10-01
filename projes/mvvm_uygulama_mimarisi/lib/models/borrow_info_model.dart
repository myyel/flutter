import 'package:cloud_firestore/cloud_firestore.dart';

class BorrowInfo {
  final String name;
  final String surname;
  final String photoUrl;
  final Timestamp borrowDate;
  final Timestamp returnDate;

  BorrowInfo(
      {required this.name,
      required this.surname,
      required this.photoUrl,
      required this.borrowDate,
      required this.returnDate});

  Map<String, dynamic> toMap() => {
        "name": name,
        "surname": "surname",
        "photoUrl": photoUrl,
        "borrowDate": borrowDate,
        "returnDate": returnDate
      };

  factory BorrowInfo.fromMap(Map map) => BorrowInfo(
        name: map["name"],
        surname: map["surname"],
        photoUrl: map["photoUrl"],
        borrowDate: map["borrowDate"],
        returnDate: map["returnDate"],
      );

  factory BorrowInfo.fromDocument(DocumentSnapshot doc) => BorrowInfo(
        name: doc.get("name"),
        surname: doc.get("surname"),
        photoUrl: doc.get("photoUrl"),
        borrowDate: doc.get("borrowDate"),
        returnDate: doc.get("returnDate"),
      );
}
