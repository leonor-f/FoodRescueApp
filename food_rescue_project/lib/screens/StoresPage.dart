import 'dart:async';
 
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
 
class MyMapPage extends StatefulWidget {
  @override
  State<MyMapPage> createState() => MapPageState();
}
 
class MapPageState extends State<MyMapPage> {
  Completer<GoogleMapController> _controller = Completer();
 
  LocationData? currentlocation ;

  Future<Position> _getCurrentLocation() async{
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      return Future.error('Location services are disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied){
        return Future.error('Location permissions are denied');
      }
    }
    if(permission == LocationPermission.deniedForever){
      return Future.error(
        'Location permissions are permantely denied');
    }
    return await Geolocator.getCurrentPosition();


  } 

  @override
 void initState() {
    super.initState();
    _getCurrentLocation().then((position) {
      setState(() {
        currentlocation = LocationData.fromMap({
          "latitude": position.latitude,
          "longitude": position.longitude,
        });
      });
    }).catchError((error) {
      print('Error getting current location: $error');
    });
  }


  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
      target: currentlocation != null
          ? LatLng(currentlocation!.latitude!, currentlocation!.longitude!)
          : LatLng(0, 0),
      zoom: 14.5,
     
    );
    return Scaffold(
      body: currentlocation == null 
      ? const Center(child: Text("Loading"))
      :GoogleMap(
        mapType: MapType.normal,
         myLocationEnabled: true,
         padding: EdgeInsets.only(top: 460.0,),
        initialCameraPosition: initialCameraPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
        Marker(markerId: MarkerId("source"),
        position: LatLng(currentlocation!.latitude!, currentlocation!.longitude!),
        ),
      },
      ),

    );
  }
}