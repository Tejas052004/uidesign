import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapController extends GetxController {
  Rx<LatLng> currentPosition = const LatLng(0, 0).obs;
  RxBool isMapReady = false.obs;
  RxSet<Marker> markers = <Marker>{}.obs;

  GoogleMapController? mapController;

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    try {
      Location location = Location();

      bool serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          isMapReady.value = true; // Still ready, just default location
          return;
        }
      }

      PermissionStatus permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          isMapReady.value = true;
          return;
        }
      }

      final locationData = await location.getLocation();
      final latLng = LatLng(locationData.latitude ?? 0, locationData.longitude ?? 0);
      currentPosition.value = latLng;

      markers.add(
        Marker(
          markerId: const MarkerId("current"),
          position: latLng,
          infoWindow: const InfoWindow(title: "You are here"),
        ),
      );

      isMapReady.value = true;
    } catch (e) {
      print("Error getting location: $e");
      isMapReady.value = true; // Ensure map shows even if location fails
    }
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
}
