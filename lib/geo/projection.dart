import 'dart:math';

import 'package:latlong2/latlong.dart';
import 'package:mysteria/geo/crs.dart';

class Projection {
  late Crs _crs;
  late double _zoom;

  Projection._(double size, List<LatLng> areaCoords) {
    _crs = const Epsg3857();
    _zoom = _getBestZoom(size, areaCoords);
  }

  Point<double> latLngToPoint(LatLng latlng) =>
      _crs.latLngToPoint(latlng, _zoom);

  double _getBestZoom(
    double size,
    List<LatLng> coords,
  ) {
    double zoom = 10.0;

    while (zoom >= 0) {
      if (coords.any((c) => _notFitArea(size, _crs.latLngToPoint(c, zoom)))) {
        zoom -= 0.5;
        continue;
      }

      return zoom;
    }

    return 0;
  }

  bool _notFitArea(double size, Point point) => !_fitArea(size, point);

  bool _fitArea(double size, Point point) {
    final max = size - 24;
    return (point.x >= 0 && point.x <= max) && (point.y >= 0 && point.y <= max);
  }

  static Projection? _instance;

  static void init(double size, List<LatLng> coords) {
    _instance = Projection._(size, coords);
  }

  static Projection get instance => _instance!;
}
