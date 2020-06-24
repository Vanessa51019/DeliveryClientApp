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

    return SafeArea(
      child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/background.jpg",),fit: BoxFit.cover)
            ),
            width: width,
            height: height,
            child: Column(
              children: <Widget>[
                RaisedButton(
                  color: Colors.blue,
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ChatPage()));
                  },
                  child: Text("Chat with us".toUpperCase()),
                )

              ],
            ),


          )),
    );
  }
}
