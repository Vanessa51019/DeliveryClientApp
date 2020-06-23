import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/firebase_services/basic_firebase.dart';
import 'package:delivery_app/models/cart_product.dart';
import 'package:delivery_app/models/order.dart';
import 'package:delivery_app/utils/session_manager.dart';

class OrderController{
  static Future<List<Order>> getAllOrders() async {
    
    QuerySnapshot docSnapshot = await db
      .collection("orders")
      .getDocuments();
    if(docSnapshot == null || docSnapshot.documents.length == 0){
      return null;
    }
    List<Order> orderList = [];
    orderList = docSnapshot.documents.map((doc) => Order.fromJson(doc.data)).toList();
    return orderList;
  }

  static Future<void> placeOrder(double totalAmount, List<CartProduct> cartProductList) async {
    String id = db.collection("orders").document().documentID;
    var _cartProductList = [];
    for(int i=0; i<cartProductList.length; i++){
      _cartProductList.add(cartProductList[i].toJson());
    }
    await db.collection("orders")
    .document(id)
    .setData({
      "id": id,
      "driverId": "nEuFGdqcBJXtsqXyNmNzozAhL5D2",
      "orderBy": SessionManager.getUserId(),
      "orderDate": DateTime.now(),
      "orderName" : "SUC-200412-40",
      "position" : GeoPoint(13, -89),
      "totalAmount" : totalAmount.toString(),
      "status" : "New",
      "products" : _cartProductList,
    });
  }
}