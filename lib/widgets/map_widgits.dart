import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  final LatLng initialLocation;
  final LatLng? ambulanceLocation;
  final LatLng? patientLocation;

  const MapWidget({
    super.key,
    required this.initialLocation,
    this.ambulanceLocation,
    this.patientLocation,
  });

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late GoogleMapController _mapController;

  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _setMarkers();
  }

  void _setMarkers() {
    _markers.clear();

    // 🚑 Ambulance Marker
    if (widget.ambulanceLocation != null) {
      _markers.add(
        Marker(
          markerId: const MarkerId("ambulance"),
          position: widget.ambulanceLocation!,
          infoWindow: const InfoWindow(title: "Ambulance"),
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueRed),
        ),
      );
    }

    // 🧍 Patient Marker
    if (widget.patientLocation != null) {
      _markers.add(
        Marker(
          markerId: const MarkerId("patient"),
          position: widget.patientLocation!,
          infoWindow: const InfoWindow(title: "Patient"),
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueBlue),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: widget.initialLocation,
        zoom: 14,
      ),
      onMapCreated: (controller) {
        _mapController = controller;
      },
      markers: _markers,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      zoomControlsEnabled: false,
    );
  }
}