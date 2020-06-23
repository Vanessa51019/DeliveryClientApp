class CartProduct {
  String productId;
  String productImage;
  String productName;
  int count;
  String productPrice;

  CartProduct(
    {
      this.productId,
      this.productImage,
      this.productName,
      this.count, 
      this.productPrice
    }
  );


  CartProduct.fromJson(Map<dynamic, dynamic> json){
    productId = json['productId'];
    productImage = json['productImage'];
    productName = json['productName'];
    count = json['count'];
    productPrice = json['productPrice'];
  }


  Map<String, dynamic> toJson() => {
    'productId' : productId,
    'productImage': productImage,
    'productName': productName,
    'count': count,
    'productPrice': productPrice,
  };
}
