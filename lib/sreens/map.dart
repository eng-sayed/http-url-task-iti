import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iti_flutter/models/user.dart';
import 'package:maps_launcher/maps_launcher.dart';

class MapSample extends StatefulWidget {
  Geo userLocation;
  MapSample({this.userLocation});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition kGooglePlex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kGooglePlex = CameraPosition(
      target: LatLng(
          double.parse(widget.userLocation.lat),
          double.parse(widget.userLocation.lng)),
      zoom: 14.4746,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(),
      body: GoogleMap(
        mapType: MapType.satellite,
        initialCameraPosition: kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openLocation,
        //label: Text('To the lake!'),
        child: Icon(Icons.location_on),
      ),
    );
  }

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }

  openLocation() {
    MapsLauncher.launchCoordinates(
      double.parse(widget.userLocation.lat),
      double.parse(widget.userLocation.lng),
    );
  }
}
