import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/screens/client/doctorDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AppointmentPage extends StatefulWidget {
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {



  int activeSpeciality = 1;
  List doctors = [];
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAllDoctorsData();
  }
  
  _getAllDoctorsData() async {
    doctors = (await Firestore.instance.collection("doctors").where("speciality",isEqualTo: "S"+ activeSpeciality.toString()).getDocuments()).documents;
    setState(() {

    });
  }


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
                      InkWell(
                        onTap: (){
                            activeSpeciality = 1;
                            _getAllDoctorsData();
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: MediaQuery.of(context).size.width*0.25,
                              width: MediaQuery.of(context).size.width*0.25,
                              decoration: BoxDecoration(
                                color: Color(0xffb1e2e2),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Icon(Icons.favorite),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text("Lorem ipsum", style: TextStyle(fontSize: 13, color: Color(0xffb1e2e2)),)
                            )
                          ],
                        ),
                      ),

                      InkWell(
                        onTap: (){
                            activeSpeciality = 2;
                            _getAllDoctorsData();
                        },
                        child: Column(
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
                      ),

                      InkWell(
                        onTap: (){
                            activeSpeciality = 3;
                            _getAllDoctorsData();
                        },
                        child: Column(
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
                          itemCount: doctors.length,
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
    return InkWell(
      onTap: ()=> Navigator.of(context).push(CupertinoPageRoute(builder: (context)=> DoctorDetails(doctors[index]))),
      child: Container(
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
                Text("Dr.${doctors[index]["name"]}", style: TextStyle(color: Colors.white),),
                Text("${doctors[index]["speciality"]}", style: TextStyle(fontSize: 13, color: Colors.white),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}