import 'dart:async';
 
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
 
void main() {
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Map Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyMapPage(),
    );
  }
}
 
class MyMapPage extends StatefulWidget {
  @override
  State<MyMapPage> createState() => MapPageState();
}
 
class MapPageState extends State<MyMapPage> {
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