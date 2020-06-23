import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/firebase_services/basic_firebase.dart';
import 'package:delivery_app/models/cart_product.dart';
import 'package:delivery_app/utils/session_manager.dart';

class CartController{
  static Future<List<CartProduct>> getAllCartProducts() async {
    
    QuerySnapshot docSnapshot = await db
      .collection("carts")
      .where("clientId", isEqualTo: SessionManager.getUserId())
      .getDocuments();
    if(docSnapshot == null || docSnapshot.documents.length == 0){
      return [];
   }
    List<CartProduct> cartProductList = [];
    for(int i=0; i< docSnapshot.documents[0]['products'].length; i++){
      cartProductList.add(new CartProduct.fromJson(docSnapshot.documents[0]['products'][i]));
    }
    return cartProductList;
  }  

  static Future<void> deleteCartProduct(List<CartProduct> cartProductList) async {
    QuerySnapshot docSnapshot = await db
      .collection("carts")
      .where("clientId", isEqualTo: SessionManager.getUserId())
      .getDocuments();

    var _updatedCartProducts = [];
    for(int i=0; i < cartProductList.length; i++){
      _updatedCartProducts.add(cartProductList[i].toJson());
    }

    docSnapshot.documents[0].reference.updateData({
      "products" : _updatedCartProducts,
    });
  }

  static Future<void> updateCartProductCount(List<CartProduct> cartProductList) async {
    QuerySnapshot docSnapshot = await db
      .collection("carts")
      .where("clientId", isEqualTo: SessionManager.getUserId())
      .getDocuments();

    var _updatedCartProducts = [];
    for(int i=0; i < cartProductList.length; i++){
      _updatedCartProducts.add(cartProductList[i].toJson());
    }

    if(docSnapshot == null || docSnapshot.documents.length == 0){
      String id = db.collection("carts").document().documentID;
      await db.collection("carts")
      .document(id)
      .setData({
        "id": id,
        "clientId": SessionManager.getUserId(),
        "products": _updatedCartProducts
      });
    }
    else{

      docSnapshot.documents[0].reference.updateData({
        "products" : _updatedCartProducts,
      });
    }
  }

  static Future<void> deleteAllCartProducts() async {
    QuerySnapshot docSnapshot = await db
      .collection("carts")
      .where("clientId", isEqualTo: SessionManager.getUserId())
      .getDocuments();

    if(docSnapshot == null || docSnapshot.documents.length == 0) return null;
    docSnapshot.documents[0].reference.delete();
  }
}
