import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/firebase_services/basic_firebase.dart';
import 'package:delivery_app/models/order.dart';

class OrderController{
  static Future<List<Order>> getAllCategories() async {
    
    QuerySnapshot docSnapshot = await db
      .collection("orders")
      .getDocuments();
    if(docSnapshot == null || docSnapshot.documents.length == 0){
      return null;
    }
    List<Order> orderList = [];
    orderList = docSnapshot.documents.map((dynamic doc) => Order.fromJson(doc.data)).toList();
    return orderList;
  }
}