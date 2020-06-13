import 'package:delivery_app/custom/ad_add_edit_modal.dart';
import 'package:delivery_app/custom/delete_ads_modal.dart';
import 'package:delivery_app/screens/client/home.dart';
import 'package:delivery_app/screens/client/orders.dart';
import 'package:flutter/material.dart';

class Ads extends StatefulWidget {

  @override
  _AdsState createState() => _AdsState();

}
class _AdsState extends State<Ads> {
  
  @override
  void initState() {
    //TODO
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      if(index == 0){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Home()),
        );
      }

      else if(index == 3){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Orders()),
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
              icon: Icon(Icons.local_shipping),
              title: Text(
                'Orders',
              )
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              title: Text(
                'Stock',
              )
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.date_range),
              title: Text(
                'Appointments',
              )
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.volume_up),
              title: Text(
                'Ads',
              )
            )
          ],
          currentIndex: 3,
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

          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Image.asset("assets/images/small_logo.png"),
                    Center(
                      child: Text("ADS", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: MaterialButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AdAddEditModal(),
                        );
                      },
                      height: 35,
                      minWidth: 50,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            'ADD NEW AD',
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

              Container(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
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
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 5,
                child: Container(
                  margin: EdgeInsets.only(left: 70, right: 70,),
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child:  ListView.builder(
                      itemCount: 3,
                      itemBuilder: searchResult,
                    ),
                  ),
                ),
              ),
              
            ],
          ),
        ],
      ),
    );
  }

  Widget searchResult(BuildContext context, int index){
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(right: 5),
      height: MediaQuery.of(context).size.height/3,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 3,color: Color.fromRGBO(192, 212, 220, 1)),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                
                GestureDetector(
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => DeleteAdsModal(),
                    );
                  },
                  child: Icon(Icons.delete_forever, color: Colors.red,),
                ),

                Center(
                  child: Row(
                    children: <Widget>[
                      Text("Available", style: TextStyle(color: Color.fromRGBO(73, 93, 105, 1), fontSize: 13, fontWeight: FontWeight.bold),),
                      Switch(
                        onChanged: (value){

                        },
                        value: true,
                        activeColor: Color.fromRGBO(0, 193, 93, 1),
                      ),
                    ],
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AdAddEditModal(),
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
              ],
            ),
          ),

          Expanded(
            flex: 6,
            child: Container(
              child: Image.asset("assets/products/product3.jpg", fit: BoxFit.cover)
            ),
          ),

          Expanded(
            flex: 1,
            child: Text(
              "Ads about holiday", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromRGBO(73, 93, 105, 1)),
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}