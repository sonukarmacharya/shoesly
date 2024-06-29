import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Stream<QuerySnapshot> getBrands() {
    return FirebaseFirestore.instance.collection('brands').snapshots();
  }

  Stream<QuerySnapshot> getAllProdducts() {
    return FirebaseFirestore.instance.collection('products').snapshots();
  }

  Stream<QuerySnapshot> getAllProdductsByBrand(String brandName) {
    return FirebaseFirestore.instance
        .collection('products')
        .where("b_id", isEqualTo: brandName)
        .snapshots();
  }

  Stream<QuerySnapshot> getProdductDetails(String id) {
    return FirebaseFirestore.instance
        .collection('products')
        .where("b_id", isEqualTo: id)
        .snapshots();
  }
}
