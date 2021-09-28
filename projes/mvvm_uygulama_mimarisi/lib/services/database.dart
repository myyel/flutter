import 'package:cloud_firestore/cloud_firestore.dart';

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
}
