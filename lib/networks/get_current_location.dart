import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

Future<String> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Check if location services are enabled
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    await Geolocator.requestPermission();
  }

  // Check for permission
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error('Location permissions are permanently denied.');
  }
  try {
    var position= await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    List<Placemark> placeMarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,

    );

    Placemark place = placeMarks[0];
    return "${place.street}, ${place.locality}, ${place.country}";
  } catch (e) {
    return "Address not found";
  }

}

