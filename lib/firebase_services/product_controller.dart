
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/firebase_services/basic_firebase.dart';
import 'package:delivery_app/models/product.dart';

class ProductController{
  static Future<List<Product>> getAllAvailableProducts() async {
    
    QuerySnapshot docSnapshot = await db
      .collection("products")
      .where("available", isEqualTo: true)
      .getDocuments();
    if(docSnapshot == null || docSnapshot.documents.length == 0){
      return [];
    }
    List<Product> productList = [];
    productList = docSnapshot.documents.map((dynamic doc) => Product.fromJson(doc.data)).toList();
    return productList;
  }  
}
