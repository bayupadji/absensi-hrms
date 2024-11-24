import 'dart:async';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  String _currentLocation = 'Unknown';
  String _currentAddress = 'Unknown Address';

  String get currentLocation => _currentLocation;
  String get currentAddress => _currentAddress;

  @override
  void onInit() {
    super.onInit();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        _currentLocation = 'Location services are disabled.';
        update();
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
          _currentLocation = 'Location permissions are denied';
          update();
          return;
        }
      }

      LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 0,
      );

      Position position = await Geolocator.getCurrentPosition(locationSettings: locationSettings);
      _currentLocation = 'Lat: ${position.latitude}, Lon: ${position.longitude}';
      update();

      // Panggil fungsi untuk mendapatkan alamat dari koordinat
      await _getAddressFromCoordinates(position.latitude, position.longitude);
    } catch (e) {
      _currentLocation = 'Error: ${e.toString()}';
      update();
    }
  }

  Future<void> _getAddressFromCoordinates(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        _currentAddress = '${place.street},${place.locality}, ${place.administrativeArea}';
      } else {
        _currentAddress = 'No address available';
      }
    } catch (e) {
      _currentAddress = 'Error: ${e.toString()}';
    }
    update();
  }
}
