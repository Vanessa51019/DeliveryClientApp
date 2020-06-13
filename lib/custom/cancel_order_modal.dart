import 'package:flutter/material.dart';
class CancelOrderModal extends StatefulWidget {
  @override
  _CancelOrderModalState createState() => _CancelOrderModalState();
}

class _CancelOrderModalState extends State<CancelOrderModal> {
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
        height: 300,
        padding: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Text(
                    "Cancel the order",
                    style: TextStyle(color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold),
                  ),

                  Text(
                    "Order SUC-200412-23",
                    style: TextStyle(fontSize: 13,),
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(3),
                child: TextFormField(
                  style: TextStyle(fontSize: 13),
                  maxLines: 6,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    ),
                    hintText: "Must specially the reason of the cancel.."
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(5),
                child: Text("If you press the button yes, the order is going to pass to have the status as Cancelled and you only will can see the order, in the History tab. \n\nDo you want to cancel the order?"),
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
                    child: Text("NO", style: TextStyle(color: Colors.white)),
                  ),

                  SizedBox(width: 50),

                  MaterialButton(
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    height: 25,
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text("YES", style: TextStyle(color: Colors.white)),
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