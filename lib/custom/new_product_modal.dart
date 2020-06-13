import 'package:flutter/material.dart';
class NewProductModal extends StatefulWidget {

  @override
  _NewProductModalState createState() => _NewProductModalState();
}

class _NewProductModalState extends State<NewProductModal> {
  @override
  Widget build(BuildContext context) {
    return Dialog(     
      backgroundColor: Colors.white,
      child: Container(
        padding: EdgeInsets.all(5),
        child: ListView(
          children: <Widget>[
            Container(
              height: 150,
              child: Image.asset("assets/products/product2.jpg"),
            ),

            Container(
              height: 50,
              margin: EdgeInsets.only(bottom: 7),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                  ),
                  hintText: "Category Name"
                ),
              ),
            ),

            Container(
              height: 50,
              margin: EdgeInsets.only(bottom: 7),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                  ),
                  hintText: "Prduct Code"
                ),
              ),
            ),

            Container(
              height: 50,
              margin: EdgeInsets.only(bottom: 7),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                  ),
                  hintText: "Product Name"
                ),
              ),
            ),

            Container(
              height: 50,
              margin: EdgeInsets.only(bottom: 7),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                  ),
                  hintText: "Product Price"
                ),
              ),
            ),

            TextFormField(
              maxLines: 7,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                ),
                hintText: "Product Description"
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