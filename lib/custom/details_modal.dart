import 'package:flutter/material.dart';
class DetailsModal extends StatefulWidget {

  @override
  _DetailsModalState createState() => _DetailsModalState();
}

class _DetailsModalState extends State<DetailsModal> {
  int count;
  @override
  void initState() {
    count = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(     
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height/2,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Text(
                            "DETAILS",
                            style: TextStyle(
                              color: Color.fromRGBO(0, 193, 255, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Text(
                            "Order SUC-2001412-25",
                            style: TextStyle(

                              fontSize: 14,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    flex: 4,
                    child: ListView(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
                          ),
                          height: 60,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Cant: x1"),
                                    Text("\$5.98")
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    RichText(
                                      text: TextSpan(
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(text: 'Item: '),
                                          TextSpan(text: 'Pizza pack deli', style: TextStyle(color: Color.fromRGBO(0, 193, 255, 1), fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          decoration: BoxDecoration(
                            border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
                          ),
                          height: 40,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Cant: x1"),
                                    Text("\$5.98")
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    RichText(
                                      text: TextSpan(
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(text: 'Item: '),
                                          TextSpan(text: 'Pizza pack deli', style: TextStyle(color: Color.fromRGBO(0, 193, 255, 1), fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    flex:3,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.grey, width: 0.5), bottom: BorderSide(color: Colors.grey, width: 0.5))
                      ),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: 'ORDER NOTES: '),
                            TextSpan(text: 'The pizza without anchovis. Deliver the food in front of the door, do not touch the bell. Put the mediciine in the mailbox', style: new TextStyle(fontSize: 13, color: Color.fromRGBO(0, 193, 255, 1))),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Expanded(
                    flex: 1,
                    child: MaterialButton(
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      height: 20,
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text("Close", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}