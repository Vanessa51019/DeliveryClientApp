import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';


class TrackOrder extends StatefulWidget {

  @override
  _TrackOrderState createState() => _TrackOrderState();
}
class _TrackOrderState extends State<TrackOrder> {

  Completer<GoogleMapController> _controller = Completer();

  LatLng _center = LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 14.0,
          ),
        ),
    );
  }
}