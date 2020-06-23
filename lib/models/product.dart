class Product {
  String id;
  String image;
  String catId;
  String productCode;
  String productName;
  String productPrice;
  String productDescription;
  bool available;
  bool offer;
  String discountPercent;
  String discountAmount;

  Product(
    {
      this.id,
      this.image,
      this.catId,
      this.productCode,
      this.productName,
      this.productPrice,
      this.productDescription,
      this.available,
      this.offer, 
      this.discountPercent,
      this.discountAmount
    }
  );


  Product.fromJson(Map<dynamic, dynamic> json){
    id = json['id'];
    image = json['image'];
    catId = json['catId'];
    productCode = json['productCode'];
    productName = json['productName'];
    productPrice = json['productPrice'];
    productDescription = json['productDescription'];
    available = json['available'];
    offer = json['offer'];
    discountPercent = json['discountPercent'];
    discountAmount = json['discountAmount'];
  }


  Map<String, dynamic> toJson() => {
    'id' : id,
    'image' : image,
    'catId': catId,
    'productCode': productCode,
    'productName': productName,
    'productPrice': productPrice,
    'productDescription': productDescription,
    'available' : available,
    'offer' : offer,
    'discountPercent' : discountPercent,
    'discountAmount' : discountAmount
  };
}
