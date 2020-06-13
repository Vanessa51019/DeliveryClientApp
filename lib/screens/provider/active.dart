import 'package:delivery_app/custom/cancel_order_modal.dart';
import 'package:delivery_app/custom/deliver_order_modal.dart';
import 'package:delivery_app/custom/details_modal.dart';
import 'package:delivery_app/screens/client/home.dart';
import 'package:delivery_app/screens/client/search.dart';
import 'package:delivery_app/screens/provider/history.dart';
import 'package:flutter/material.dart';

class Active extends StatefulWidget {

  @override
  _ActiveState createState() => _ActiveState();

}
class _ActiveState extends State<Active> {

  int _selectedIndex = 0;
  
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

      else if(index == 1){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Search()),
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
          currentIndex: _selectedIndex,
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
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Image.asset("assets/images/small_logo.png"),
                    Center(
                      child: Text("ORDERS", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Expanded(
                flex: 6,
                child: Container(
                  color: Colors.white,
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: MaterialButton(
                                color: Color.fromRGBO(0, 193, 255, 1),
                                onPressed: (){},
                                child: Text("Active", style: TextStyle(color: Colors.white),),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: MaterialButton(
                                color: Color.fromRGBO(237, 237, 237, 1),
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (_) => History()),
                                  );
                                },
                                child: Text("History"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Type the text in the product",
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
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: Text(
                                "Show:",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: <Widget>[
                                        Transform.scale(
                                          scale: 0.8,
                                          child: Checkbox(
                                            value: true,
                                            onChanged: (value){

                                            },
                                          ),
                                        ),
                                        Text("New", style: TextStyle(fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: <Widget>[
                                        Transform.scale(
                                          scale: 0.8,
                                          child: Checkbox(
                                            value: true,
                                            onChanged: (value){

                                            },
                                          ),
                                        ),
                                        Text("Ready", style: TextStyle(fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: <Widget>[
                                        Transform.scale(
                                          scale: 0.8,
                                          child: Checkbox(
                                            value: true,
                                            onChanged: (value){

                                            },
                                          ),
                                        ),
                                        Text("Preparing", style: TextStyle(fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: <Widget>[
                                        Transform.scale(
                                          scale: 0.8,
                                          child: Checkbox(
                                            value: true,
                                            onChanged: (value){

                                            },
                                          ),
                                        ),
                                        Text("Delivering", style: TextStyle(fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          padding: EdgeInsets.only(right: 5, left: 5),
                          child: ListView.builder(
                            itemCount: 4,
                            itemBuilder: order,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget order(BuildContext context, int index){
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Color.fromRGBO(73, 93, 105, 1), width: 1)
        ),
      ),
      height:200,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text("1 min ago", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromRGBO(73, 93, 105, 1)),),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex:1,
                        child: Text(
                          "Order SUC -200412-25", style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(73, 93, 105, 1)),
                        ),
                      ),
                      Expanded(
                        flex:1,
                        child: Text("Status New", style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(73, 93, 105, 1)),),
                      ),
                      Expanded(
                        flex:1,
                        child: Text("Orderby: Jhon Doe", style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(73, 93, 105, 1)),),
                      ),
                      Expanded(
                        flex:1,
                        child: Text("Order date: 2020-04-14 15:31", style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(73, 93, 105, 1)),),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: MaterialButton(
                          onPressed: (){
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => DetailsModal(),
                            );
                          },
                          color: Color.fromRGBO(0, 106, 240, 1),
                          child: Text("Details", style: TextStyle(color: Colors.white, ),),
                        ),
                      ),
                      SizedBox(height: 5),
                      Expanded(
                        flex: 1,
                        child: Text("\$10.98", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)
                      ),
                      Expanded(
                        flex: 2,
                        child: Container()
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MaterialButton(
                    color: Colors.red,
                    height: 25,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    onPressed: (){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => CancelOrderModal(),
                      );
                    },
                    child: Text("CANCEL", style: TextStyle(color: Colors.white),),
                  ),
                  index == 2 ? MaterialButton(
                    color: Color.fromRGBO(0, 61, 184, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    height: 25,
                    onPressed: (){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => DeliverOrderModal(),
                      );
                    },
                    child: Text("DELIVER", style: TextStyle(color: Colors.white)),
                  ) : MaterialButton(
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    height: 25,
                    onPressed: (){
                      
                    },
                    child: Text("ACCEPT", style: TextStyle(color: Colors.white)),
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