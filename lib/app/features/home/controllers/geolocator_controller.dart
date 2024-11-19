import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
String _currentLocation = 'Unknown';

  String get currentLocation => _currentLocation;

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
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          _currentLocation = 'Location permissions are denied';
          update();
          return;
        }
      }

      LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      );

      Position position = await Geolocator.getCurrentPosition(locationSettings: locationSettings);
      _currentLocation = 'Lat: ${position.latitude}, Lon: ${position.longitude}';
      update();
    } catch (e) {
      _currentLocation = 'Error: ${e.toString()}';
      update();
    }
  }
}
