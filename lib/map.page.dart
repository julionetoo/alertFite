import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  Set<Marker> markers = new Set<Marker>();
  double lat = -10.2348901;
  double long = -48.3263274;

  void _onMapCreated(GoogleMapController controller){
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {

    LatLng position = LatLng(-10.2014149, -48.2854467);

    final Marker marker = Marker(
      markerId: new MarkerId("1234"),
      position: position,
      infoWindow: InfoWindow(
        title: "Sensor 1 ",
        snippet: 'Limpão - Mirante',
      ),
    );
    setState(() {
      markers.add(marker);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Localização dos Sensores"),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(lat, long),
          zoom: 11.0,
        ),
        markers: markers,
      ),
    );
  }
}
