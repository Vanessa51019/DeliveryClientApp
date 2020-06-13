import 'package:flutter/material.dart';
class DeleteAdsModal extends StatefulWidget {

  @override
  _DeleteAdsModalState createState() => _DeleteAdsModalState();
}

class _DeleteAdsModalState extends State<DeleteAdsModal> {
  @override
  Widget build(BuildContext context) {
    return Dialog(     
      backgroundColor: Colors.white,
      child: Container(
        height: 100,
        padding: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[

            Expanded(
              flex: 1,
              child: Center(
                child: Text("Do you want to delete this Ad?", style: TextStyle(fontWeight: FontWeight.bold),),
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