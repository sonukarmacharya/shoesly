import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future<void> insertData(String name, String email, String password) async {
    // TODO: implement insertData
  }

  Future<Stream<QuerySnapshot>> getBrands() async {
    return FirebaseFirestore.instance.collection('brand').snapshots();
  }

  Future<void> deleteData(String name, String email, String password) async {
    // TODO: implement deleteData
  }
}
