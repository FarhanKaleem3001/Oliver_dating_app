import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationProvider with ChangeNotifier {
  String _location = "Fetching location...";
  LatLng? _selectedLatLng;
  GoogleMapController? _mapController;

  String get location => _location;
  LatLng? get selectedLatLng => _selectedLatLng;

  LocationProvider() {
    _initializeLocation();
  }

  void setMapController(GoogleMapController controller) {
    _mapController = controller;
  }

  Future<void> _initializeLocation() async {
    try {
      Position position = await _getCurrentPosition();
      _selectedLatLng = LatLng(position.latitude, position.longitude);
      await _getAddressFromLatLng(_selectedLatLng!);

      if (_mapController != null) {
        _mapController!.animateCamera(
          CameraUpdate.newLatLng(_selectedLatLng!),
        );
      }
    } catch (e) {
      _location = "Location not available";
      debugPrint("Location error: $e");
    }
    notifyListeners();
  }

  Future<Position> _getCurrentPosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("Location services are disabled.");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      throw Exception("Location permissions are denied.");
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<void> _getAddressFromLatLng(LatLng latLng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        _location = "${place.locality}, ${place.country}";
      }
    } catch (e) {
      _location = "${latLng.latitude}, ${latLng.longitude}";
      debugPrint("Address error: $e");
    }
  }
}
