import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/background.jpg",),fit: BoxFit.cover)
            ),
            padding: EdgeInsets.only(top: 30),
            width: width,
            height: height,
            child: Column(
              children: <Widget>[
                Image.asset("assets/images/small_logo.png"),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text("NOTIFICATIONS", style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w800),)
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: MediaQuery.removePadding(
                      removeTop: true,
                      context: context,
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: notification,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget notification(BuildContext context, int index){
    return Slidable(
      actionExtentRatio: 0.25,
      actionPane: SlidableDrawerActionPane(),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: IconSlideAction(
            color: Colors.red,
            iconWidget: Icon(Icons.delete, size: 35, color: Colors.white,),
            onTap: () {
              // Delete notification
            },
          ),
        ),
      ],
      child: Container(
        height: 100,
        margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 50, 
              height: 50,
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 182, 192, 1),
                borderRadius: BorderRadius.circular(25)
              ),
              child: Icon(Icons.perm_identity, color: Colors.white,),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("21/06/2020 03:00 p.m.", style: TextStyle(color: Colors.blue[300], fontWeight: FontWeight.w600),),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text("The provider has accepted your appointment request")
                    ),
                  ],
                ),
              ),
            ),

            Container(
              width: 10,
              height: 10,
              margin: EdgeInsets.only(left: 20, right: 15),
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 183, 0, 1),
                borderRadius: BorderRadius.circular(5)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
