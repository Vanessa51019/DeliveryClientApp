import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/models/cart_product.dart';

class Order {
  String id;
  String orderName;
  String orderBy;
  DateTime orderDate;
  String status;
  GeoPoint position;
  String totalAmount;
  var products;

  Order(
    {
      this.id,
      this.orderName,
      this.orderBy,
      this.orderDate,
      this.status,
      this.position,
      this.totalAmount,
      this.products
    }
  );


  Order.fromJson(Map<dynamic, dynamic> json){
    id = json['id'];
    orderName = json['orderName'];
    orderBy = json['orderBy'];
    orderDate = json['orderDate'].toDate();
    status = json['status'];
    position = json['position'];
    totalAmount = json['totalAmount'];
    var _products = [];
    for(int i=0; i< json['products'].length; i++){
      _products.add(new CartProduct.fromJson(json['products'][i]));
      products = _products;
    }
  }


  Map<String, dynamic> toJson() => {
    'id' : id,
    'orderName': orderName,
    'orderBy': orderBy,
    'orderDate': orderDate,
    'status': status,
    'position': position,
    'totalAmount' : totalAmount,
    'products': products.map((product) {return product.toJson();}),
  };
}
