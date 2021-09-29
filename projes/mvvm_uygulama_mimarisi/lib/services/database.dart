import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mvvm_uygulama_mimarisi/models/books_model.dart';

class Database {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ///Firestore servisinden kitapların verisini stream olarak alıp sağlamak

  Stream<QuerySnapshot> getBookListFromApi(String referencePath) {
    return _firestore.collection(referencePath).snapshots();
  }

  ///Firestore üzerinden veri crud işlemleri hizmeti

  /// Veriyi silme hizmeti
  Future<void> deleteDocument(
      {required String referencePath, required String id}) async {
    await _firestore.collection(referencePath).doc(id).delete();
  }

  ///Yeni veri ekleme
  Future<void> setBookData(
      {required String collectionRef,
      required Map<String, dynamic> bookAsMap}) async {
    await _firestore
        .collection(collectionRef)
        .doc(Books.fromMap(bookAsMap).id)
        .set(bookAsMap);
  }
}
