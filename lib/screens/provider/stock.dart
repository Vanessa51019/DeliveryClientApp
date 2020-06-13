import 'package:delivery_app/custom/delete_category_modal.dart';
import 'package:delivery_app/custom/new_or_edit_category_modal.dart';
import 'package:delivery_app/custom/new_product_modal.dart';
import 'package:delivery_app/custom/offer_modal.dart';
import 'package:delivery_app/screens/client/home.dart';
import 'package:delivery_app/screens/client/orders.dart';
import 'package:delivery_app/screens/client/search.dart';
import 'package:flutter/material.dart';

class Stock extends StatefulWidget {

  @override
  _StockState createState() => _StockState();

}
class _StockState extends State<Stock> {

  bool isOnlyProduct = false;
  bool isOnlyNotProduct = false;
  bool isOffer = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      if(index == 1){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Search()),
        );
      }

      else if(index == 3){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Orders()),
        );
      }

      else if(index == 0){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Home()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(156, 174, 202, 1),
        // sets the active color of the `BottomNavigationBar` if `Brightness` is light
        textTheme: Theme
          .of(context)
          .textTheme
          .copyWith(caption: new TextStyle(color: Colors.white))),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text(
                  'Home',
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text(
                  'Search',
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                title: Text(
                  'Appointments',
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_shipping),
                title: Text(
                  'Orders',
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                title: Text(
                  'Notifications',
                )),
            BottomNavigationBarItem(
            icon: Icon(Icons.email),
            title: Text(
              'Contact Us',
            ))
          ],
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          fixedColor: Color.fromRGBO(3, 119, 155, 1),
          onTap: _onItemTapped,
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset("assets/images/background.jpg", fit: BoxFit.cover),
          ),

          Container(
            padding: EdgeInsets.only(left: 10, right: 10, bottom :10),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Image.asset("assets/images/small_logo.png"),
                      Center(
                        child: Text("STOCK", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                ),
                
                SizedBox(height: 10,),
                
                Expanded(
                  flex: 6,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 2, 
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width*2/5,
                              child: MaterialButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) => NewOrEditCategoryModal(),
                                  );
                                },
                                height: 35,
                                minWidth: 50,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text(
                                      'NEW CATEGORY',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Roboto Medium',
                                        color: Color(0xFFFFFFFF),
                                      ),
                                    )
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    side: BorderSide(
                                      color: Colors.white,
                                      width: 2.0,
                                    )),
                              ),
                            ),

                            Container(
                              width: MediaQuery.of(context).size.width*2/5,
                              child: MaterialButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) => NewProductModal(),
                                  );
                                },
                                height: 35,
                                minWidth: 50,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text(
                                      'NEW PRODUCT',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Roboto Medium',
                                        color: Color(0xFFFFFFFF),
                                      ),
                                    )
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    side: BorderSide(
                                      color: Colors.white,
                                      width: 2.0,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        flex: 2, 
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Type the word in the product",
                            hintStyle: TextStyle(color: Color.fromRGBO(198, 216, 223, 1),),
                            border: OutlineInputBorder(
                            ),
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(0.0),
                              child: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ), // icon is 48px widget.
                            ),
                          ),
                        ),
                      ),

                      Expanded(
                        flex: 3, 
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: <Widget>[
                                  Theme(
                                    data: ThemeData(unselectedWidgetColor: Colors.white),
                                    child: Checkbox(
                                      checkColor: Colors.black,
                                      activeColor: Colors.white,
                                      onChanged: (value){
                                        setState(() {
                                          isOnlyProduct = !isOnlyProduct;
                                        });
                                      },
                                      value: isOnlyProduct,
                                    ),
                                  ),
                                  Text(
                                    "Show only products in offer",
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15,),
                                  ),
                                ],
                              ),
                            ),

                            Expanded(
                              flex: 1,
                              child: Row(
                                children: <Widget>[
                                  Theme(
                                    data: ThemeData(unselectedWidgetColor: Colors.white),
                                    child: Checkbox(
                                      checkColor: Colors.black,
                                      activeColor: Colors.white,
                                      onChanged: (value){
                                        setState(() {
                                          isOnlyNotProduct = !isOnlyNotProduct;
                                        });
                                      },
                                      value: isOnlyNotProduct,
                                    ),
                                  ),

                                  Text(
                                    "Show only not available products",
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15,),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        flex: 17, 
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView.builder(
                            itemCount: 3,
                            itemBuilder: category,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget category(BuildContext context, int index){
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 180,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => NewOrEditCategoryModal(),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.blue),
                      ),
                      child: Text(
                        "EDIT", style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                  Center(
                    child: Text("Food", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                  ),
                  GestureDetector(
                    onTap: (){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => DeleteCategoryModal(),
                      );
                    },
                    child: Icon(Icons.delete_forever, color: Colors.red,),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            flex: 7,
            child: Container(
              padding: EdgeInsets.all(5),
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2, 
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Image.asset("assets/products/product2.jpg")
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text("Available"),
                                   SizedBox(
                                     height: 12,
                                     child: Transform.scale(
                                      scale: 0.7,
                                      child: Switch(
                                        activeColor: Color.fromRGBO(0, 193, 93, 1),
                                        onChanged: (val) => setState(() => true),
                                        value: true,
                                      ),
                                    ),
                                   ),
                                ],
                              ),
                              SizedBox(height: 3,),
                              Row(
                                children: <Widget>[
                                  Text("Offer       "),
                                  SizedBox(
                                     height: 12,
                                     child: Transform.scale(
                                      scale: 0.7,
                                      child: Switch(
                                        activeColor: Color.fromRGBO(0, 193, 93, 1),
                                        onChanged: (val) {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) => OfferModal(),
                                          );
                                          setState(() => isOffer = val);
                                        },
                                        value: isOffer,
                                      ),
                                    ),
                                   ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ),

                  Expanded(
                    flex: 3, 
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              onTap: (){
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) => NewOrEditCategoryModal(),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: Colors.blue),
                                ),
                                child: Text(
                                  "EDIT", style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                
                              },
                              child: Icon(Icons.delete_forever, color: Colors.red,),
                            ),
                          ],
                        ),
                        Text("Product Code"),
                        Text("PRO-001", style: TextStyle(fontWeight: FontWeight.bold),),
                        Text("Product Price"),
                        Text("\$15.98", style: TextStyle(fontWeight: FontWeight.bold),),
                        Text("Product Name"),
                        Text("Pizza pack1", style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}