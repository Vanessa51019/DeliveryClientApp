import 'package:flutter/material.dart';
class OfferModal extends StatefulWidget {

  @override
  _OfferModalState createState() => _OfferModalState();
}

class _OfferModalState extends State<OfferModal> {
  @override
  Widget build(BuildContext context) {
    return Dialog(     
      backgroundColor: Colors.white,
      child: Container(
        height: MediaQuery.of(context).size.height/2,
        padding: EdgeInsets.all(5),
        child: ListView(
          children: <Widget>[
            Container(
              height: 50,
              margin: EdgeInsets.only(top: 30,bottom: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                  ),
                  hintText: "Regular price"
                ),
              ),
            ),

            Container(
              height: 50,
              margin: EdgeInsets.only(bottom: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                  ),
                  hintText: "Percent of discount(%)"
                ),
              ),
            ),

            Container(
              height: 50,
              margin: EdgeInsets.only(bottom: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                  ),
                  hintText: "Amount of discount(\$)"
                ),
              ),
            ),
            Row(
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
          ]
        ),
      ),
    );
  }
}