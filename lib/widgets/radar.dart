import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:mysteria/geo/projection.dart';
import 'package:mysteria/util/images.dart';
import 'package:mysteria/vm/pontos_interesse_vm.dart';
import 'package:provider/provider.dart';

class RadarBoundary {
  final LatLng northWest;
  final LatLng northEast;
  final LatLng southEast;
  final LatLng southWest;

  RadarBoundary(
    this.northWest,
    this.northEast,
    this.southEast,
    this.southWest,
  );

  List<LatLng> get allPoints => <LatLng>[
        northWest,
        northEast,
        southEast,
        southWest,
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
  final userPoint = const Icon(
    Icons.place,
    color: Colors.blue,
    size: 32,
  );

  final interestPoint = const Icon(
    Icons.place,
    color: Colors.yellow,
    size: 32,
  );

  final collectablePoint = const Icon(
    Icons.place,
    shadows: <Shadow>[
      Shadow(color: Colors.white, blurRadius: 15.0),
    ],
    color: Colors.yellow,
    size: 32,
  );

  late double topLeft;
  late double topRight;

  @override
  void initState() {
    super.initState();

    Projection.init(widget.size, widget.boundary.allPoints);
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<PontoInteresseViewModel>(context);
    final proximos = vm.pontosProximos
        .map(
          (e) => _locationToWidget(e, interestPoint),
        )
        .toList();

    final coletaveis = vm.pontosProximos
        .map(
          (e) => _locationToWidget(e, collectablePoint),
        )
        .toList();

    return Stack(
      children: [
        _BaseRadar(widget.size),
        _locationToWidget(vm.jogador!, userPoint),
        ...coletaveis,
        ...proximos,
      ],
    );
  }

  Positioned _locationToWidget(LatLng location, Widget widget) {
    final proj = Projection.instance;
    final point = proj.latLngToPoint(location);

    print("location: $location");
    print("_locationToWidget: $point");

    return Positioned(
      top: point.y,
      left: point.x,
      child: widget,
    );
  }
}

class _BaseRadar extends StatefulWidget {
  final double size;

  const _BaseRadar(this.size);

  @override
  State<_BaseRadar> createState() => _BaseRadarState();
}

class _BaseRadarState extends State<_BaseRadar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 20))
          ..repeat();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Images.radarBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: _RadarSignal(
        controller: _controller,
      ),
    );
  }
}

class _RadarSignal extends StatelessWidget {
  final AnimationController _controller;

  const _RadarSignal({required AnimationController controller})
      : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 4.0).animate(_controller),
      child: Container(
        decoration: const BoxDecoration(
          gradient: SweepGradient(
            center: FractionalOffset.center,
            colors: <Color>[
              Colors.transparent,
              Color(0xFF34A853),
              Colors.transparent,
            ],
            stops: <double>[0.20, 0.25, 0.20],
          ),
        ),
      ),
    );
  }
}
