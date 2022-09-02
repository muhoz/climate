import 'package:geolocator/geolocator.dart';

class Positioning {
  late double latitude;
  late double longitude;

  Positioning({this.latitude=0,this.longitude=0});

  Future<void> getCurrentPosition() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {}
  }
}
