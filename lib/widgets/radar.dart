import 'package:flutter/material.dart';
import 'package:mysteria/util/location.dart';

class RadarBoundary {
  final Point topLeft;
  final Point topRight;
  final Point bottomLeft;
  final Point bottomRight;

  RadarBoundary(
    this.topLeft,
    this.topRight,
    this.bottomRight,
    this.bottomLeft,
  );

  List<Point> get allPoints => <Point>[
        topLeft,
        topRight,
        bottomRight,
        bottomLeft,
      ];
}

class Radar extends StatefulWidget {
  final double size;
  final RadarBoundary boundary;

  const Radar({
    super.key,
    required this.size,
    required this.boundary,
  });

  @override
  State<Radar> createState() => _RadarState();
}

class _RadarState extends State<Radar> {
  late double topLeft;
  late double topRight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: widget.size,
          width: widget.size,
          decoration: const BoxDecoration(
            color: Colors.amber,
          ),
        ),
        const Positioned(
          top: 0,
          left: 0,
          width: 24,
          height: 24,
          child: Icon(
            Icons.place,
            color: Colors.blue,
            size: 24,
          ),
        ),
      ],
    );
  }
}

class RadarController {
  final RadarBoundary boundary;
  final ValueNotifier<List<Point>> points = ValueNotifier(<Point>[]);

  late double boardSize;

  RadarController({required this.boundary});

  factory RadarController.fromBoudary(RadarBoundary boundary) {
    return RadarController(boundary: boundary);
  }

  void getLocationInBoard(Point point) {
    _findNearestCorner(point);
  }

  Point _findNearestCorner(Point point) {
    double distance = 0.0;
    Point? corner;

    final allCorners = boundary.allPoints;

    for (var i = 0; i < allCorners.length; i++) {
      final currentDistance = getDistanceFromLatLonInMeters(
        point,
        allCorners[i],
      );

      if (i == 0) {
        distance = currentDistance;
        corner = allCorners[i];
        continue;
      }

      if (currentDistance < distance) {
        distance = currentDistance;
        corner = allCorners[i];
      }
    }

    return corner!;
  }
}
