import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;
import 'package:fluttertoast/fluttertoast.dart';

class DoctorDetails extends StatefulWidget{

  DocumentSnapshot details;
  DoctorDetails(this.details);

  @override
  State<StatefulWidget> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails>{

  List<DocumentSnapshot> appointments = [];

  String _selectedTime = "";
  DateTime selectedDate = DateTime.now();

  //Mark Today as a marked date
  List<DateTime> _markedDate = [DateTime.now()];


  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {
      new DateTime(2019, 2, 10): [
        new Event(
          date: new DateTime.now(),
          title: 'Event 1',
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.red,
            height: 5.0,
            width: 5.0,
          ),
        ),

      ],
    },
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDoctorsAppointments();
  }

  _getDoctorsAppointments()async {
    Firestore.instance.collection("doctors").document(widget.details.documentID).collection("appointments").snapshots().listen((event) {

//      setState(() {
        appointments = event.documents;
        print("appointments updated");
        print(appointments);
//      });
    });
  }

  _addAppointment() async {
    if(appointments.where((element) => DateTime.parse(element.data["chosenDate"].toDate().toString()).day == selectedDate.day && DateTime.parse(element.data["chosenDate"].toDate().toString()).month == selectedDate.month && DateTime.parse(element.data["chosenDate"].toDate().toString()).year == selectedDate.year && element.data["chosenTime"] == _selectedTime).length > 0){
      //This means that this date already exist so you cant choose it
      Fluttertoast.showToast(msg: "This Date and time has already been taken");
      return;
    }
    if(_selectedTime == ""){
      Fluttertoast.showToast(msg: "You have to select a time");
      return;
    }

    var user = (await FirebaseAuth.instance.currentUser()).uid;
    Firestore.instance.collection("doctors").document(widget.details.documentID).collection("appointments").add({
      "chosenDate": selectedDate,
      "chosenTime": _selectedTime,
      "takenBy": user,
      "approved": false
    }).then((value) async {

      var clientName = (await Firestore.instance.collection("clients").document(user).get())["name"];

      Firestore.instance.collection("providers").document(widget.details["providerUid"]).collection("notifications").add({
        "timeStamp": FieldValue.serverTimestamp(),
        "message": "$clientName has sent you an appointment request",
        "seen": false
      });
      Navigator.of(context).pop();
      Fluttertoast.showToast(msg: "Appointment Taken");
    });
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Appointments"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: CalendarCarousel<Event>(
                onDayPressed: (DateTime day, List<Event> events) {
                  if(day.weekday == 6 || day.weekday == 7){
                    Fluttertoast.showToast(msg: "You can't pick a weekend day");
                    return;
                  }
                  if(appointments.where((element) => DateTime.parse(element.data["chosenDate"].toDate().toString()).day == day.day && DateTime.parse(element.data["chosenDate"].toDate().toString()).month == day.month && DateTime.parse(element.data["chosenDate"].toDate().toString()).year == day.year && element.data["chosenTime"] == _selectedTime).length > 0){
                    Fluttertoast.showToast(msg: "This day and time is already taken");
                    return;
                  }
//                  this.setState(() => _currentDate = date);
                setState(() {
                  selectedDate = day;
                });
                },
                weekendTextStyle: TextStyle(
                  color: Colors.blue,
                ),
                thisMonthDayBorderColor: Colors.grey,
//      weekDays: null, /// for pass null when you do not want to render weekDays
//      headerText: Container( /// Example for rendering custom header
//        child: Text('Custom Header'),
//      ),
                customDayBuilder: (   /// you can provide your own build function to make custom day containers
                    bool isSelectable,
                    int index,
                    bool isSelectedDay,
                    bool isToday,
                    bool isPrevMonthDay,
                    TextStyle textStyle,
                    bool isNextMonthDay,
                    bool isThisMonthDay,
                    DateTime day,
                    ) {
                  /// If you return null, [CalendarCarousel] will build container for current [day] with default function.
                  /// This way you can build custom containers for specific days only, leaving rest as default.

                  // Example: every 15th of month, we have a flight, we can place an icon in the container like that:
                  print(day);
                  if (appointments.where((element) => DateTime.parse(element.data["chosenDate"].toDate().toString()).day == day.day && DateTime.parse(element.data["chosenDate"].toDate().toString()).month == day.month && DateTime.parse(element.data["chosenDate"].toDate().toString()).year == day.year  && element.data["chosenTime"] == _selectedTime).length > 0) {
                    return Center(
                      child: Icon(Icons.cancel,color: Colors.red,),
                    );
                  }
                  else {
                    return null;
                  }
                },
                weekFormat: false,
                selectedDateTime: selectedDate,
                height: 420.0,
                todayButtonColor: Colors.white,
                todayTextStyle: TextStyle(color: Colors.black),
                markedDatesMap: _markedDateMap,
                daysHaveCircularBorder: true, /// null for not rendering any border, true for circular border, false for rectangular border
              ),
            ),
            Container(
              width: width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: width,
                        alignment: Alignment.center,
                        child: Text("Select the time",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                    Text("Morning"),
                    Divider(),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(8, (index){
                          var time = 8 + (index * 0.5);
                          return InkWell(
                              onTap: (){
                                if(appointments.where((element) => DateTime.parse(element.data["chosenDate"].toDate().toString()).day == selectedDate.day && DateTime.parse(element.data["chosenDate"].toDate().toString()).month == selectedDate.month && DateTime.parse(element.data["chosenDate"].toDate().toString()).year == selectedDate.year && element.data["chosenTime"] == time.toString().replaceAll(".5", ": 30").replaceAll(".0", ": 00")).length > 0){
                                  Fluttertoast.showToast(msg: "This time is already taken");
                                  return;
                                }
                                setState(() {
                                  _selectedTime = time.toString().replaceAll(".5", ": 30").replaceAll(".0", ": 00");
                                });
                              },
                              child: Container(
                                  color: time.toString().replaceAll(".5", ": 30").replaceAll(".0", ": 00") == _selectedTime? Colors.greenAccent: appointments.where((element) => DateTime.parse(element.data["chosenDate"].toDate().toString()).day == selectedDate.day && DateTime.parse(element.data["chosenDate"].toDate().toString()).month == selectedDate.month && DateTime.parse(element.data["chosenDate"].toDate().toString()).year == selectedDate.year && element.data["chosenTime"] == time.toString().replaceAll(".5", ": 30").replaceAll(".0", ": 00")).length > 0? Colors.grey: null,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(time.toString().replaceAll(".5", ": 30").replaceAll(".0", ": 00")),
                                  )));
                        }),
                      ),
                    ),
                    Divider(),
                    Text("Afternoon"),
                    Divider(),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(11, (index){
                          var time = 12 + (index * 0.5);
                          return InkWell(
                              onTap: (){
                                setState(() {
                                  _selectedTime = time.toString().replaceAll(".5", ": 30").replaceAll(".0", ": 00");
                                });
                              },
                              child: Container(
                                  color: time.toString().replaceAll(".5", ": 30").replaceAll(".0", ": 00") == _selectedTime? Colors.greenAccent: null,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(time.toString().replaceAll(".5", ": 30").replaceAll(".0", ": 00")),
                                  )));
                        }),
                      ),
                    ),
                    Divider(),
                    Row(
                      children: [],
                    ),
                    Container(
                      width: width,
                      child: ButtonBar(
                        alignment: MainAxisAlignment.spaceEvenly,
                        buttonMinWidth: width * 0.4,
                        children: [
                          RaisedButton(
                            color: Theme.of(context).primaryColor,
                            onPressed: ()=> _addAppointment(),
                            child: Text("Confirm"),
                          ),
                          RaisedButton(
                            color: Colors.redAccent,

                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            child: Text("Cancel"),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}