import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  var latitude = 'gett'.obs;
  var longitude = 'gett'.obs;
  var address = 'gett'.obs;
  var selectedLocation = 'Your Location'.obs;
  late StreamSubscription<Position> streamSubscription;

  void currentLocation() {
    selectedLocation = address;
  }

  void searchedLocation() {}

  @override
  void onInit() async {
    getLocation();
    super.onInit();
  }

  void getLocation() async {
    late bool serviceEnabled;
    late LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location Services Disable');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('error');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('error');
    }

    streamSubscription =
        Geolocator.getPositionStream().listen((Position position) {
      latitude.value = position.latitude.toString();
      longitude.value = position.longitude.toString();
      getAddresFromLatLong(position);
    });
  }

  Future<void> getAddresFromLatLong(Position position) async {
    List<Placemark> placeMark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placeMark[0];
    address.value = place.street.toString();
  }
}
