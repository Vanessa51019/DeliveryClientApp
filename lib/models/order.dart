import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Order {
  String id;
  String orderName;
  String orderBy;
  DateTime orderDate;
  String status;
  GeoPoint position;

  Order(
    {
      this.id,
      this.orderName,
      this.orderBy,
      this.orderDate,
      this.status,
      this.position
    }
  );


  Order.fromJson(Map<dynamic, dynamic> json){
    id = json['id'];
    orderName = json['orderName'];
    orderBy = json['orderBy'];
    orderDate = json['orderDate'].toDate();
    status = json['status'];
    position = json['position'];
  }


  Map<String, dynamic> toJson() => {
    'id' : id,
    'orderName': orderName,
    'orderBy': orderBy,
    'orderDate': orderDate,
    'status': status,
    'position': position,
  };
}
