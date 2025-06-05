import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationController extends GetxController {
  Rx<Position?> currentPosition = Rx<Position?>(null);
  RxString currentAddress = ''.obs;

  Future<void> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }
    if (permission == LocationPermission.deniedForever) return;
    currentPosition.value = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    if (currentPosition.value != null) {
      await getAddressFromLatLng(
        currentPosition.value!.latitude,
        currentPosition.value!.longitude,
      );
    } else {
      currentAddress.value = "No location found";
    }
  }

  Future<void> getAddressFromLatLng(double lat, double lng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        currentAddress.value =
            "${place.street ?? ''}, ${place.locality ?? ''}, ${place.administrativeArea ?? ''}, ${place.country ?? ''}";
      } else {
        currentAddress.value = "No address found";
      }
    } catch (e) {
      currentAddress.value = "Error: $e";
    }
  }
}