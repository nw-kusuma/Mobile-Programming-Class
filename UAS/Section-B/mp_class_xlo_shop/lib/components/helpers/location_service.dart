import 'package:geocode/geocode.dart';
import 'package:location/location.dart';

class LocationService{
  Future<LocationData?> getLocation() async{
    bool _serviceEnabled = await Location().serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await Location().requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    PermissionStatus _permissionGranted = await Location().hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await Location().requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }
    LocationData _locationData = await Location().getLocation();

    return _locationData;
  }

  Future<String> getAddress(double? lat, double? lang) async {
  if (lat == null || lang == null) return "";
  GeoCode geoCode = GeoCode();
  Address address =
      await geoCode.reverseGeocoding(latitude: lat, longitude: lang);
  // return "${address.streetAddress}, ${address.city}, ${address.countryName}, ${address.postal}";
  return "${address.streetAddress}, ${address.region}, ${address.countryName}";
}
}