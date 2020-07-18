import 'package:delivery_app/screens/client/chatpage.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
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
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Image.asset("assets/images/small_logo.png"),
                  Text("Contact Us", style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w800),),
                  
                  Padding(
                    padding: EdgeInsets.only(left: 35, right: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 20),
                          child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor", style: TextStyle(color: Colors.white.withOpacity(0.7)),)
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.location_on, color: Colors.white,),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text("385 Noah Place Suite 878", style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7)),)
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 25, bottom: 25),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.phone, color: Colors.white,),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text("877-255-7945", style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7)),)
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.email, color: Colors.white,),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text("info@form.com", style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7)),)
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 150,
                    
                  ),
                  MaterialButton(
                    color: Colors.green,
                    minWidth: MediaQuery.of(context).size.width*0.8,
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ChatPage()));
                    },
                    child: Text("Chat with us".toUpperCase(), style: TextStyle(color: Colors.white),),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
