import 'package:delivery_app/models/cart_product.dart';

class Cart {
  String id;
  String clientId;
  var products;

  Cart(
    {
      this.id,
      this.clientId,
      this.products,
    }
  );


  Cart.fromJson(Map<dynamic, dynamic> json){
    id = json['id'];
    clientId = json['clientId'];
    var _products = [];
    for(int i=0; i< json['products'].length; i++){
      _products.add(new CartProduct.fromJson(json['products'][i]));
      products = _products;
    }
  }


  Map<String, dynamic> toJson() => {
    'id' : id,
    'clientId': clientId,
    'products': products.map((product) {return product.toJson();}),
  };
}
