import 'package:flutter/material.dart';
class AdAddEditModal extends StatefulWidget {

  @override
  _AdAddEditModalState createState() => _AdAddEditModalState();
}

class _AdAddEditModalState extends State<AdAddEditModal> {
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
              flex: 3,
              child: Image.asset("assets/products/product2.jpg"),
            ),

            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(3),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    ),
                    hintText: "Ad Name"
                  ),
                ),
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
                    child: Text("CANCEL", style: TextStyle(color: Colors.white)),
                  ),

                  SizedBox(width: 50),

                  MaterialButton(
                    color: Color.fromRGBO(0, 193, 93, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    height: 25,
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text("SAVE", style: TextStyle(color: Colors.white)),
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