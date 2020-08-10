import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/screens/client/doctorDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class AppointmentPage extends StatefulWidget {
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {



  int activeSpeciality = 1;
  List doctors = [];
  List pendingAppointments = [];

  PersistentBottomSheetController _bottomSheetController;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAllDoctorsData();
    _getAllPendingAppointment();

  }


  
  _getAllDoctorsData() async {
    doctors = (await Firestore.instance.collection("doctors").where("speciality",isEqualTo: "S"+ activeSpeciality.toString()).getDocuments()).documents;
    setState(() {

    });
  }

  _getAllPendingAppointment() async {
    //Go through the appointments for all doctors and find out if they are valid

    Firestore.instance.collection("doctors").snapshots().listen((allDoctors) {

      pendingAppointments = [];
      allDoctors.documents.forEach((element) async {
        print(element);
        var appointments = (await Firestore.instance.collection("doctors").document(element.documentID).collection("appointments").orderBy("chosenDate").getDocuments());

        if(appointments.documents.length > 0){
          //Check if the doctor has any appointments
          appointments.documents.forEach((element2) async {

            print(element);
            if(DateTime.parse(element2.data["chosenDate"].toDate().toString()).difference(DateTime.now()).inDays >= 0 ){

              var clientName = (await Firestore.instance.collection("clients").document(element2.data['takenBy']).get()).data["name"];
              pendingAppointments.add({
                "data": element2,
                "doctorData": element,
                "takenBy": clientName
              });

              _bottomSheetController?.setState((){});
            }
          });

        }
      });
    });



  }


  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

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

//            Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Builder(
//                builder:(context)=> RaisedButton(
//                  color: Colors.orangeAccent,
//                    onPressed: ()async {
//                    print(pendingAppointments);
//                    await _getAllPendingAppointment();
//                      _bottomSheetController = Scaffold.of(context).showBottomSheet((context)=>Container(
//                        width: width,
//                        height: height * .8,
//                        color: Colors.blue,
//                        child: Column(
//                          children: <Widget>[Container(
//                            width: width,
//                            alignment: Alignment.centerLeft,
//                            child: IconButton(icon:Icon(Icons.cancel),onPressed: ()=> Navigator.of(context).pop(),),
//                          )] + pendingAppointments.map((e){
//
//                            var today = DateTime.parse(e['data'].data["chosenDate"].toDate().toString());
//
//                            return Card(
//                              child: ListTile(
//                                leading: CircleAvatar(
//                                    child: Icon(Icons.person)
//                                ),
//                                title: Text("Dr ${e["doctorData"].data["name"]}"),
//                                subtitle: Column(
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: [
//                                    Text("${today.year.toString()}-${today.month.toString().padLeft(2,'0')}-${today.day.toString().padLeft(2,'0')} ${e['data']["chosenTime"]}"),
//                                    Text("TakenBy: ${e["takenBy"]}"),
//                                    e['data']["approved"]? Container(): ButtonBar(
//                                      alignment: MainAxisAlignment.start,
//                                      children: [
//                                        RaisedButton(
//                                          color: Colors.green,
//                                          onPressed: (){
////                                            _bottomSheetController.setState((){
//                                              e["data"].reference.updateData({
//                                                "approved": true
//                                              });
//                                              _getAllPendingAppointment();
////                                            });
//
//                            },
//                                          child: Container(
//                                            child: Text("Approve"),
//                                          ),
//                                        ),
//                                        RaisedButton(
//                                          color: Colors.red,
//                                          onPressed: (){
//                                              e["data"].reference.delete();
//                                              _getAllPendingAppointment();
//
//                            },
//                                          child: Container(
//                                            child: Text("Cancel"),
//                                          ),
//                                        ),
//                                      ],
//                                    )
//                                  ],
//                                ),
//
//                              ),
//                            );
//                          }).toList(),
//                        ),
//
//                      ));
//                    },
//                    child: Container(
//                        width: width,
//                        height: 50,
//                        alignment: Alignment.center,
//                        child: Text("Show All Pending")
//                    )
//                ),
//              ),
//            ),

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
                Text("${doctors[index]["speciality"]}".replaceAll("S1", "Plastic Surgeon").replaceAll("S2", "General Practitioner").replaceAll("S3", "Cardiologist"), style: TextStyle(fontSize: 13, color: Colors.white),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}