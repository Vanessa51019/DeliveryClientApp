import 'package:delivery_app/screens/client/contact.dart';
import 'package:delivery_app/screens/client/home.dart';
import 'package:delivery_app/screens/client/orders.dart';
import 'package:delivery_app/screens/client/search.dart';
import 'package:flutter/material.dart';

class Start extends StatefulWidget {

  @override
  _StartState createState() => _StartState();

}
class _StartState extends State<Start> {


  Widget tabBody;
  bool promotionVertical = false;
  bool adsVerticalValue = false;
  bool horizontal = true;
  int currentIndex = 0;

  @override
  void initState() {
    tabBody = Home();

    super.initState();
  }

  void _onItemTapped(int index) {

     print(index);
    setState(() {
      switch(index) {
        case 0: 
          { 
            setState(() {
              tabBody = Home();
              currentIndex = index;
            });
          }
        break;
        case 1: 
          {
            setState(() {
              tabBody = Search();
              currentIndex = index;
            });
          }
        break;
        case 2: 
          {
            setState(() {
              tabBody = Orders();
              currentIndex = index;
            });
          }
        break;
        case 3: 
          {
            setState(() {
              tabBody = Orders();
              currentIndex = index;
            });
          }
        break;

        case 4:
          {
            setState(() {
              // tabBody = Search();
              currentIndex = index;
            });
          }
        break;

        case 5:
          {
            setState(() {
               tabBody = ContactPage();
              currentIndex = index;
            });
          }
        break;

        default: 
          {
            // tabBody = Search();
            currentIndex = index;
          }
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
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          fixedColor: Color.fromRGBO(3, 119, 155, 1),
          onTap: _onItemTapped,
        ),
      ),
      body: tabBody,
    );
  }
}