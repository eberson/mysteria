import 'dart:developer';
import 'dart:math' hide log;

import 'package:latlong2/latlong.dart';

double getDistanceFromLatLonInKilometers(LatLng p1, LatLng p2) {
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

double getDistanceFromLatLonInMeters(LatLng p1, LatLng p2) {
  final distance = getDistanceFromLatLonInKilometers(p1, p2) * 1000;

  log("distance between $p1 and $p2 was $distance");
  return distance;
}

double deg2rad(deg) {
  return deg * (pi / 180);
}
