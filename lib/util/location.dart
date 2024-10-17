import 'dart:math';

class Point {
  final double latitude;
  final double longitude;

  Point({
    required this.latitude,
    required this.longitude,
  });

  factory Point.fromCoords(double latitude, double longitude) {
    return Point(latitude: latitude, longitude: longitude);
  }
}

double getDistanceFromLatLonInKilometers(Point p1, Point p2) {
  var R = 6371; // Radius of the earth in km

  var dLat = deg2rad(p2.latitude - p1.latitude);
  var dLon = deg2rad(p2.longitude - p1.longitude);

  var a = sin(dLat / 2) * sin(dLat / 2) +
      cos(deg2rad(p1.latitude)) *
          cos(deg2rad(p2.latitude)) *
          sin(dLon / 2) *
          sin(dLon / 2);

  var c = 2 * atan2(sqrt(a), sqrt(1 - a));

  var d = R * c; // Distance in km

  return d;
}

double getDistanceFromLatLonInMeters(Point p1, Point p2) {
  return getDistanceFromLatLonInKilometers(p1, p2) * 1000;
}

double deg2rad(deg) {
  return deg * (pi / 180);
}
