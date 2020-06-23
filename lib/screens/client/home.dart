import 'package:badges/badges.dart';
import 'package:delivery_app/firebase_services/ads_controller.dart';
import 'package:delivery_app/firebase_services/cart_controller.dart';
import 'package:delivery_app/firebase_services/product_controller.dart';
import 'package:delivery_app/models/ads_model.dart';
import 'package:delivery_app/models/cart_product.dart';
import 'package:delivery_app/models/product.dart';
import 'package:delivery_app/screens/client/add_cart.dart';
import 'package:delivery_app/screens/client/cart_view.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();

}
class _HomeState extends State<Home> {

  bool promotionVertical = false;
  bool adsVerticalValue = false;
  bool horizontal = true;
  List<Product> productList = [];
  List<Ads> adsList = [];
  int cartProductCount = 0;
  @override
  void initState() {
    getAllCartProducts();
    getAllAvailableAds();
    getAllAvailableProducts();
    super.initState();
  }

  getAllAvailableProducts() async {
    List<Product> _productList = await ProductController.getAllAvailableProducts();
    setState(() {
      productList = _productList;
    });
  }

  getAllAvailableAds() async {
    List<Ads> _adsList = await AdsController.getAllAvailableAds();
    setState(() {
      adsList = _adsList;
    });
  }

  getAllCartProducts() async {
    List<CartProduct> _cartProductList = await CartController.getAllCartProducts();
    setState(() {
      cartProductCount = _cartProductList.length;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset("assets/images/background.jpg", fit: BoxFit.cover),
          ),
          Visibility(
            visible: horizontal,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => CartView()),  
                      ).then((value){
                        setState(() {
                          cartProductCount = value;
                        });
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 25, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(Icons.settings, color: Color.fromRGBO(192, 220, 245, 1)),
                          Badge(
                            badgeContent: Text(cartProductCount.toString() , style: TextStyle(color: Colors.white),),
                            child: Icon(Icons.shopping_cart, color: Color.fromRGBO(192, 220, 245, 1)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Image.asset("assets/images/small_logo.png"),
                  Text("Home", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex:1,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10,),
                              child: Text("Promotions", style: TextStyle(color: Colors.white,)),
                            ),
                          ),
                          Expanded(
                            flex:8,
                            child: Container(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: productList.length,
                                itemBuilder: product,
                              )
                            ),
                          ),
                          Expanded(
                            flex:1,
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  horizontal = false;
                                  promotionVertical = true;
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.only(left: 10,),
                                child: Text("Show all promotions", style: TextStyle(color: Color.fromRGBO(14, 187, 238, 1),),),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex:1,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10,),
                              child: Text("Ads", style: TextStyle(color: Colors.white,),),
                            ),
                          ),
                          Expanded(
                            flex:8,
                            child: Container(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: adsList.length,
                                itemBuilder: ads,
                              )
                            ),
                          ),
                          Expanded(
                            flex:1,
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  adsVerticalValue = true;
                                  horizontal = false;
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.only(left: 10,),
                                child: Text("Show all ads", style: TextStyle(color: Color.fromRGBO(14, 187, 238, 1),),),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Visibility(
            visible: promotionVertical,
            child: Center(
              child: Container(
                margin: EdgeInsets.only(top: 50),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width*2/3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex:1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Promotions", style: TextStyle(color: Colors.white,),),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                promotionVertical = false;
                                horizontal = true;
                              });
                            },
                            child: Text("Return", style: TextStyle(color: Color.fromRGBO(14, 187, 238, 1)),),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex:20,
                      child: Container(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: productList.length,
                          itemBuilder: productVertical,
                        )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Vertical ads
          Visibility(
            visible: adsVerticalValue,
            child: Center(
              child: Container(
                margin: EdgeInsets.only(top: 50),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width*2/3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex:1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Ads", style: TextStyle(color: Colors.white,),),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                adsVerticalValue = false;
                                horizontal = true;
                              });
                            },
                            child: Text("Return", style: TextStyle(color:Color.fromRGBO(14, 187, 238, 1),),),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex:20,
                      child: Container(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: adsList.length,
                          itemBuilder: adsVertical,
                        )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
  }

  Widget product(BuildContext context, int index){
    return Container(
      height: MediaQuery.of(context).size.height*2/3,
      width: MediaQuery.of(context).size.width*1.3/3,
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(192, 212, 220, 1))
      ),
      margin: EdgeInsets.only(left: 20),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Container(
              child: Image.network(productList[index].image, fit: BoxFit.cover)
            ),
          ),

          Expanded(
            flex: 1,
            child: Container(
              child: Text(productList[index].productName, style: TextStyle(color: Colors.white, fontSize: 16),),
            ),
          ),

          Expanded(
            flex: 1,
            child: Row(
            children: <Widget>[
              Expanded(
                flex: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("\$" + productList[index].productPrice, style: TextStyle(color: Color.fromRGBO(150, 171, 182, 1), fontSize: 12),),
                    productList[index].offer == true ? Text(productList[index].discountPercent + "% off\n \$" + productList[index].discountAmount, style: TextStyle(color: Color.fromRGBO(150, 171, 182, 1), fontSize: 12),) : Container(),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                  child: Icon(Icons.share, color: Color.fromRGBO(150, 171, 182, 1),),
                ),

                Expanded(
                  flex: 3,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => AddCart(product: productList[index])),
                      ).then((value){
                        setState(() {
                          cartProductCount = value;
                        });
                      });
                    },
                    child: Icon(Icons.shopping_cart, color: Color.fromRGBO(150, 171, 182, 1),),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }


  Widget ads(BuildContext context, int index){
    return Container(
      height: MediaQuery.of(context).size.height*2/3,
      width: MediaQuery.of(context).size.width*1.3/3,
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(192, 212, 220, 1))
      ),
      margin: EdgeInsets.only(left: 20),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 6,
            child: Container(
              // child:  Image.asset("assets/product.jpg", fit: BoxFit.cover)
              child: Image.network(adsList[index].image, fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }


  Widget productVertical(BuildContext context, int index){
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: MediaQuery.of(context).size.height/3,
      width: MediaQuery.of(context).size.width*2/3,
      decoration: BoxDecoration(
        border: Border.all(width: 3,color: Color.fromRGBO(192, 212, 220, 1)),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Container(
              child: Image.network(productList[index].image, fit: BoxFit.cover),
            ),
          ),

          Expanded(
            flex: 1,
            child: Container(
              child: Text(productList[index].productName, style: TextStyle(color: Colors.white, fontSize: 16),),
            ),
          ),

          Expanded(
            flex: 1,
            child: Row(
            children: <Widget>[
              Expanded(
                flex: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("\$"+productList[index].productPrice, style: TextStyle(color: Color.fromRGBO(150, 171, 182, 1), fontSize: 12),),
                    productList[index].offer == true ? Text(productList[index].discountPercent+"% off\n \$"+productList[index].discountAmount, style: TextStyle(color: Color.fromRGBO(150, 171, 182, 1), fontSize: 12),) : Container(),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                  child: Icon(Icons.share, color: Color.fromRGBO(150, 171, 182, 1),),
                ),

                Expanded(
                  flex: 3,
                  child: Icon(Icons.shopping_cart, color: Color.fromRGBO(150, 171, 182, 1),),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  Widget adsVertical(BuildContext context, int index){
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: MediaQuery.of(context).size.height/3,
      width: MediaQuery.of(context).size.width*2/3,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              // child: Image.asset("assets/product.jpg", fit: BoxFit.cover)
              child: Image.network(adsList[index].image, fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}