import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:mysteria/geo/bounds.dart';
import 'package:mysteria/geo/crs.dart';
import 'package:mysteria/util/images.dart';
import 'package:mysteria/util/location.dart';
import 'package:mysteria/widgets/radar.dart';
import 'package:mysteria/widgets/stack_container.dart';

import 'package:proj4dart/proj4dart.dart' as proj4;

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.julee(
      fontSize: 26,
      color: const Color.fromARGB(255, 216, 0, 0),
    );

    final screenSize = MediaQuery.of(context).size;
    final titleSize = screenSize.width - 40;

    final radarSize = screenSize.width - 60;

    print(radarSize);

    const verticalSpacer = SizedBox(
      height: 20,
    );

    print("distancia: ${getDistanceFromLatLonInMeters(
      const LatLng(-21.604675, -48.366205),
      const LatLng(-21.604710, -48.366347),
    )}");

    print("distancia: ${getDistanceFromLatLonInMeters(
      const LatLng(-21.605032, -48.367523),
      const LatLng(-21.604654, -48.368322),
    )}");

    // EPSG:4326 is a predefined projection ships with proj4dart
    final epsg4326 = proj4.Projection.get('EPSG:4326')!;

    // EPSG:3413 is a user-defined projection from a valid Proj4 definition string
    // From: http://epsg.io/3413, proj definition: http://epsg.io/3413.proj4
    // Find Projection by name or define it if not exists
    final epsg3413 = proj4.Projection.get('EPSG:3413') ??
        proj4.Projection.add('EPSG:3413',
            '+proj=stere +lat_0=90 +lat_ts=70 +lon_0=-45 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs');

    // 9 example zoom level resolutions
    final resolutions = <double>[
      131072,
      65536,
      32768,
      16384,
      8192,
      4096,
      2048,
      1024,
      512,
      256,
      128,
    ];

    final epsg3413Bounds = Bounds<double>(
      const Point<double>(0, 0),
      const Point<double>(416, 416),
    );

    final maxZoom = (resolutions.length - 1).toDouble();

    const epsg3857 = Epsg3857();

    // final epsg3857 = Proj4Crs.fromFactory(
    //   // CRS code
    //   code: 'EPSG:3413',
    //   // your proj4 delegate
    //   proj4Projection: epsg3413,
    //   // Resolution factors (projection units per pixel, for example meters/pixel)
    //   // for zoom levels; specify either scales or resolutions, not both
    //   resolutions: resolutions,
    //   // Bounds of the CRS, in projected coordinates
    //   // (if not specified, the layer's which uses this CRS will be infinite)
    //   bounds: epsg3413Bounds,
    //   // Tile origin, in projected coordinates, if set, this overrides the transformation option
    //   // Some goeserver changes origin based on zoom level
    //   // and some are not at all (use explicit/implicit null or use [Point(0, 0)])
    //   // @see https://github.com/kartena/Proj4Leaflet/pull/171
    //   // origins: const [Point(0, 0)],
    //   // Scale factors (pixels per projection unit, for example pixels/meter) for zoom levels;
    //   // specify either scales or resolutions, not both
    //   scales: null,
    // );

    final scale = 2.0;

    print(
        "point: ${epsg3857.latLngToPoint(const LatLng(-21.605032, -48.367523), scale)}");
    print(
        "point: ${epsg3857.latLngToPoint(const LatLng(-21.605032, -48.367523), scale)}");
    print(
        "point: ${epsg3857.latLngToPoint(const LatLng(-21.604654, -48.368322), scale)}");
    print(
        "point: ${epsg3857.latLngToPoint(const LatLng(-21.603862, -48.367904), scale)}");
    print(
        "point: ${epsg3857.latLngToPoint(const LatLng(-21.604241, -48.367108), scale)}");

    return Scaffold(
      body: StackContainer(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                Images.mysteriaName,
                width: titleSize,
                fit: BoxFit.fitHeight,
              ),
            ),
            Text(
              "Tempo Restante: 09:50",
              style: textStyle,
            ),
            verticalSpacer,
            Radar(
              size: radarSize,
              boundary: RadarBoundary(
                const LatLng(-21.605032, -48.367523),
                const LatLng(-21.604654, -48.368322),
                const LatLng(-21.603862, -48.367904),
                const LatLng(-21.604241, -48.367108),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
