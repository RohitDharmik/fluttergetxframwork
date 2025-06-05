import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends StatelessWidget {
  final double latitude;
  final double longitude;

  const GoogleMapPage(
      {super.key, required this.latitude, required this.longitude});

  @override
  Widget build(BuildContext context) {
    final CameraPosition initialPosition = CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 15,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Google Map')),
      body: GoogleMap(
        initialCameraPosition: initialPosition,
        markers: {
          Marker(
            markerId: const MarkerId('currentLocation'),
            position: LatLng(latitude, longitude),
          ),
        },
      ),
    );
  }
}
