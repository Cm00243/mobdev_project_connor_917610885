// lib/screens/near_me_page.dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../app_drawer.dart';

class NearMePage extends StatefulWidget {
  @override
  _NearMePageState createState() => _NearMePageState();
}

class _NearMePageState extends State<NearMePage> {
  GoogleMapController? mapController;
  LatLng _initialPosition = LatLng(37.77483, -122.41942); 
  LatLng? _currentPosition;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
      });
      mapController?.animateCamera(CameraUpdate.newLatLng(_currentPosition!));
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Near Me")),
      drawer: const AppDrawer(),
      body: _currentPosition == null
          ? const Center(child: CircularProgressIndicator()) 
          : GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: _initialPosition,
                zoom: 13.0,
              ),
              myLocationEnabled: true, 
              markers: {
                Marker(
                  markerId: MarkerId('currentLocation'),
                  position: _currentPosition!,
                  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
                ),
              },
            ),
    );
  }
}