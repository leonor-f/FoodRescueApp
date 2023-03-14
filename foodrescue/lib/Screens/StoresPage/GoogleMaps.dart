import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMapPage extends StatefulWidget {
  final Key _mapKey = UniqueKey();

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MyMapPage> {
  Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(
      32.776665,
      -96.796989,
    ),
    zoom: 10.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: initialCameraPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
