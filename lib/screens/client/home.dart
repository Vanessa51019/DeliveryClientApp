import 'package:badges/badges.dart';
import 'package:delivery_app/firebase_services/ads_controller.dart';
import 'package:delivery_app/models/ads_model.dart';
import 'package:delivery_app/screens/client/cart.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();

}
class _HomeState extends State<Home> {

  bool promotionVertical = false;
  bool adsVerticalValue = false;
  bool horizontal = true;
  List<Ads> adsList = [];
  @override
  void initState() {
    // TODO: implement initState
    getAllAds();
    super.initState();
  }

  getAllAds() async {
    List<Ads> _adsList = await AdsController.getAllAds();
    setState(() {
      adsList = _adsList;
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
                        MaterialPageRoute(builder: (_) => Cart()),  
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 25, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(Icons.settings, color: Color.fromRGBO(192, 220, 245, 1)),
                          Badge(
                            badgeContent: Text('3', style: TextStyle(color: Colors.white),),
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
                                itemCount: 3,
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
                          itemCount: 3,
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
              child: Image.asset("assets/product.jpg", fit: BoxFit.cover)
            ),
          ),

          Expanded(
            flex: 1,
            child: Container(
              child: Text("Product Name", style: TextStyle(color: Colors.white, fontSize: 16),),
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
                    Text("\$39.9", style: TextStyle(color: Color.fromRGBO(150, 171, 182, 1), fontSize: 12),),
                    Text("10% off\n \$35.5", style: TextStyle(color: Color.fromRGBO(150, 171, 182, 1), fontSize: 12),),
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
              child: Image.asset("assets/product.jpg", fit: BoxFit.cover)
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
              child: Image.asset("assets/product.jpg", fit: BoxFit.cover)
            ),
          ),

          Expanded(
            flex: 1,
            child: Container(
              child: Text("Product Name", style: TextStyle(color: Colors.white, fontSize: 16),),
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
                    Text("\$39.9", style: TextStyle(color: Color.fromRGBO(150, 171, 182, 1), fontSize: 12),),
                    Text("10% off\n \$35.5", style: TextStyle(color: Color.fromRGBO(150, 171, 182, 1), fontSize: 12),),
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
      // decoration: BoxDecoration(
      //   border: Border.all(width: 3,color: Color.fromRGBO(192, 212, 220, 1)),
      // ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              child: Image.asset("assets/product.jpg", fit: BoxFit.cover)
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