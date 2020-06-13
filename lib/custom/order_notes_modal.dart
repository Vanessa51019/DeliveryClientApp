import 'package:flutter/material.dart';
class OrderNotesModal extends StatefulWidget {
  @override
  _OrderNotesModalState createState() => _OrderNotesModalState();
}

class _OrderNotesModalState extends State<OrderNotesModal> {
  int count;
  @override
  void initState() {
    count = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(     
      backgroundColor: Colors.white,
      child: Container(
        height: 250,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Text(
                    "Order Notes",
                    style: TextStyle(color: Color.fromRGBO(0, 193, 255, 1), fontSize: 25, fontWeight: FontWeight.bold),
                  ),

                  Text(
                    "Order SUC-200412-22",
                    style: TextStyle(fontSize: 13,),
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 0.5),
                    top: BorderSide(color: Colors.grey, width: 0.5),
                  )
                ),
                child: Text("The order was cancelled because blablabla or the order was delivered with a delay or null comments"),
              ),
            ),

            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    height: 25,
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text("CLOSE", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}