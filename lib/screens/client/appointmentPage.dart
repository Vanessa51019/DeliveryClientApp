import 'package:flutter/material.dart';

class AppointmentPage extends StatefulWidget {
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/background.jpg",),fit: BoxFit.cover)
        ),
        padding: EdgeInsets.only(top: 30),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(child: Image.asset("assets/images/small_logo.png")),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
              child: Center(child: Text("Appointments", style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w800),))
            ),

            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text("Speciality", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xff00b4b9)),),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.width*0.25,
                            width: MediaQuery.of(context).size.width*0.25,
                            decoration: BoxDecoration(
                              color: Color(0xffb1e2e2),
                              borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text("Lorem ipsum", style: TextStyle(fontSize: 13, color: Color(0xffb1e2e2)),)
                          )
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.width*0.25,
                            width: MediaQuery.of(context).size.width*0.25,
                            decoration: BoxDecoration(
                              color: Color(0xff00b4b9),
                              borderRadius: BorderRadius.circular(10)
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text("Lorem ipsum", style: TextStyle(fontSize: 13, color: Color(0xff00b4b9)),)
                          ),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.width*0.25,
                            width: MediaQuery.of(context).size.width*0.25,
                            decoration: BoxDecoration(
                              color: Color(0xffb1e2e2),
                              borderRadius: BorderRadius.circular(10)
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text("Lorem ipsum", style: TextStyle(fontSize: 13, color: Color(0xffb1e2e2)),)
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 15,),

            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                color: Color(0xff00b4b9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Availability", style: TextStyle(fontSize: 16, color: Colors.white, ),),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: availability,
                        ),
                      ),
                    ),
                    SizedBox(height: 5,)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget availability(BuildContext context, int index){
    return Container(
      height: 50,
      margin: EdgeInsets.only(bottom: 8),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: ClipRRect(
              child: Image.asset("assets/images/profile.jpg", width: 50, height: 45, fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Dr.Lorem Ipsum", style: TextStyle(color: Colors.white),),
              Text("Lorem Ipsum - Hospital", style: TextStyle(fontSize: 13, color: Colors.white),),
            ],
          ),
        ],
      ),
    );
  }
}