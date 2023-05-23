import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:search_map_location/search_map_location.dart';
import 'package:search_map_location/utils/google_search/place.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:food_rescue/services/MarketDatabaseManager.dart';
import 'package:food_rescue/screens/SpecificStoreProducts/ProductsCategories.dart';
import 'package:food_rescue/home copy.dart';
import 'package:food_rescue/screens/StoresPage/BottomPanel.dart';

class MyMapPage extends StatefulWidget {
  @override
  State<MyMapPage> createState() => MapPageState();
}

List<String> get_current_store_names(List<bool?> current_Store) {
  List<String> stores = [];
  if (current_Store[0] == true) {
    stores.add('Apolónia');
  }
  if (current_Store[1] == true) {
    stores.add('Brio');
  }
  if (current_Store[2] == true) {
    stores.add('Meu Super');
  }
  if (current_Store[3] == true) {
    stores.add('Minipreço');
  }
  if (current_Store[4] == true) {
    stores.add('Continente');
  }
  if (current_Store[5] == true) {
    stores.add('Supercor');
  }
  if (current_Store[6] == true) {
    stores.add('Jumbo');
  }
  if (current_Store[7] == true) {
    stores.add('Froiz');
  }
  if (current_Store[8] == true) {
    stores.add('Lidl');
  }
  if (current_Store[9] == true) {
    stores.add('Pingo Doce');
  }
  if (current_Store[10] == true) {
    stores.add('Intermaché');
  }
  return stores;
}

class MapPageState extends State<MyMapPage> {
  Completer<GoogleMapController> _controller = Completer();

  Set<Marker> markers = {};
  late String _mapStyle;
  LocationData? currentlocation;
  late BitmapDescriptor customMarker;
  bool _markerSet = false;

  Future<void> setCustomMarker() async {
    List<Marker> newMarkers = [];
    List<bool?> current_Stores = BottomPanel.get_current_markers();
    List<String> current_Stores_Names = get_current_store_names(current_Stores);

    for (int i = 0; i < MarketDatabaseManager.allStores.length; i++) {
      for (int j = 0; j < current_Stores_Names.length; j++) {
        if (MarketDatabaseManager.allStores[i][5] == current_Stores_Names[j]) {
          final BitmapDescriptor bitmapDescriptor =
              await BitmapDescriptor.fromAssetImage(
            ImageConfiguration(size: Size(1, 1)),
            MarketDatabaseManager.allStores[i][1],
          );

          String store_name = MarketDatabaseManager.allStores[i][0];
          final Marker marker = Marker(
            markerId: MarkerId(MarketDatabaseManager.allStores[i][0]),
            position: LatLng(MarketDatabaseManager.allStores[i][2],
                MarketDatabaseManager.allStores[i][3]),
            infoWindow: InfoWindow(
                title: 'Abrir Loja: $store_name',
                onTap: () {
                  ProductPage.set_store(MarketDatabaseManager.allStores[i][4]);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MyApp_second_bar(selectedIndex: 0)),
                  );
                }),
            icon: bitmapDescriptor,
          );

          newMarkers.add(marker);
          break;
        }
      }
    }
    setState(() {
      _markerSet = true;
      markers = newMarkers.toSet(); // Convert List<Marker> to Set<Marker>
    });
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permantely denied');
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    super.initState();

    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });

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

    setCustomMarker();
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
          ? const Center(
              child: CircularProgressIndicator(
                  color: Color.fromRGBO(52, 93, 100, 0.6)),
            )
          : Column(
              children: [
                SearchLocation(
                  apiKey: "AIzaSyAZuzBWclgvDEnOnbv3dSovhuITszHRoRg",
                  country: 'PT',
                  language: 'pt',
                  radius: 2,
                  icon: Icons.place,
                  iconColor: Color.fromRGBO(52, 93, 100, 1),
                  placeholder: 'Insira um local',

                  //Search only work for this specific country
                  onSelected: (Place place) async {
                    final geolocation = await place.geolocation;
                    final coordinates = LatLng(
                        geolocation!.coordinates.latitude,
                        geolocation.coordinates.longitude);
                    setState(() {});
                    final GoogleMapController controller =
                        await _controller.future;
                    controller
                        .animateCamera(CameraUpdate.newLatLng(coordinates));
                  },
                ),
                Expanded(
                  child: FutureBuilder(
                    future: setCustomMarker(),
                    builder: (context, snapshot) {
                      if (!_markerSet) {
                        return const Center(child: Text("Loading"));
                      } else {
                        return GoogleMap(
                          mapType: MapType.normal,
                          myLocationEnabled: true,
                          padding: EdgeInsets.only(
                            top: 420.0,
                          ),
                          initialCameraPosition: initialCameraPosition,
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                            controller.setMapStyle(_mapStyle);
                          },
                          markers: markers,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
