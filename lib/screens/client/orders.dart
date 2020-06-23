import 'package:delivery_app/firebase_services/order_controller.dart';
import 'package:delivery_app/models/order.dart';
import 'package:delivery_app/screens/client/track_order.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {

  @override
  _OrdersState createState() => _OrdersState();

}
class _OrdersState extends State<Orders> {

  int _selectedIndex = 0;
  List<Order> orderList = [];
  @override
  void initState() {
    getAllOrders();
    super.initState();
  }

  getAllOrders() async {
    List<Order> _orderList = await OrderController.getAllOrders();
    setState(() {
      orderList = _orderList;
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

        Column(
          children: <Widget>[
            
            Expanded(
              flex: 2,
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

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => TrackOrder()),
                    );
                  },
                  child: Text("Track my order", style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ],
            ),

            Expanded(
              flex: 11,
              child: Container(
                margin: EdgeInsets.all(5),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child:  ListView.builder(
                    itemCount: orderList.length,
                    itemBuilder: order,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget order(BuildContext context, int index){
    return Container(
      margin: EdgeInsets.only(bottom: 15,),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(left: BorderSide(width: 7, color: index == 0 ? Colors.green : Color.fromRGBO(109, 111, 111, 1)))
      ),
      height: 90,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 20),
              child: CircleAvatar(
                radius: 1000,
                  backgroundImage: AssetImage(
                    'assets/products/order.png',
                  ),
                ),
            ),
          ),

          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(orderList[index].orderName, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)), 
                    ],
                  ),
                ),

                Expanded(
                  flex: 2,
                  child: Text("\$14.99")
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}