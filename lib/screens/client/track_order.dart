import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';


class TrackOrder extends StatefulWidget {
  
  final String orderId;
  
  TrackOrder({this.orderId});

  @override
  _TrackOrderState createState() => _TrackOrderState();
}
class _TrackOrderState extends State<TrackOrder> {

  Set<Marker> _markers = {};

  Completer<GoogleMapController> _controller = Completer();

  StreamSubscription<Position> positionStream;

  BitmapDescriptor pinLocationIcon;

  bool _initiated = false;

  LatLng _center = LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBytesFromAsset('assets/images/driver.png', 64).then((onValue) {
      pinLocationIcon =BitmapDescriptor.fromBytes(onValue);

    });
    _getAndSetPositionMarker();
  }

  void setCustomMapPin() async {
    pinLocationIcon = BitmapDescriptor.fromBytes(await getBytesFromAsset('assets/images/driver.png', 64));
  }


  updateValueToCloud(Position position){
    //This is where you track the order from
    //Assuming this device is the driver you update the order from here
    //Since it is all dummy data you would update this when you are done building the order system

    if(widget.orderId != null){
      Firestore.instance.collection("orders").document(widget.orderId).setData({
        "position": GeoPoint(position.latitude,position.longitude)
      });
    }

  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png)).buffer.asUint8List();
  }

  _getAndSetPositionMarker()async {
    var geolocator = Geolocator();
    var locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
    Firestore.instance.collection("orders").document("${widget.orderId}").snapshots().listen(
            (data) async{
              GeoPoint position = data['position'];
              var controller = await _controller.future;
              if(!_initiated){
                controller.animateCamera(CameraUpdate.newLatLng(
                    LatLng(position.latitude, position.longitude)));
              }

              //This is so it only moves to the drivers location at the beginning
              _initiated = true;


          print(position == null ? 'Unknown' : position.latitude.toString() + ', ' + position.longitude.toString());
          if(pinLocationIcon == null){
            await setCustomMapPin();
          }
          var doesTheMarkerExist = _markers.where((element) => element.markerId == MarkerId("driver"));
          //IF the marker already exists then you replace it
          if(doesTheMarkerExist.length > 0){
            setState(() {
              _markers.removeWhere((element) => element.markerId == MarkerId("driver"));
              print("pin location icon below");
              print(pinLocationIcon);
              _markers.add(Marker(
                markerId: MarkerId("driver"),
                position: LatLng(position.latitude,position.longitude),
                icon: pinLocationIcon
              ));
            });

          }
          else{
            setState(() {
              print("pin location icon below");
              print(pinLocationIcon);
              _markers.add(Marker(
                markerId: MarkerId("driver"),
                position: LatLng(position.latitude,position.longitude),
                icon: pinLocationIcon
              ));
            });

          }
        });



  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    positionStream.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: _markers,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 14.0,
          ),
        ),
    );
  }
}