import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:mysteria/entidade/charada.dart';
import 'package:mysteria/geo/location.dart';
import 'package:provider/provider.dart';

class PontoInteresseViewModel extends ChangeNotifier {
  late LatLng? _jogador;
  final Map<LatLng, Charada> _charadas = {};
  final List<LatLng> _proximos = [];

  void setUserLocation(LatLng point) {
    _jogador = point;
    onMove();
    notifyListeners();
  }

  void start(List<Charada> dicas) {
    _charadas.clear();

    for (var dica in dicas) {
      final coord = LatLng(dica.latitude, dica.longitude);
      _charadas[coord] = dica;
    }

    onMove();
    notifyListeners();
  }

  void onMove() {
    if (_jogador == null) {
      return;
    }

    _proximos.clear();
    _proximos.addAll(
      _charadas.keys
          .where((l) => getDistanceFromLatLonInMeters(_jogador!, l) < 15)
          .toList(),
    );
  }

  void reset() {
    _charadas.clear();
    _proximos.clear();
  }

  LatLng? get jogador => _jogador;
  List<LatLng> get pontosProximos => _proximos;

  static ChangeNotifierProvider<PontoInteresseViewModel> create() =>
      ChangeNotifierProvider(
        create: (_) => PontoInteresseViewModel(),
      );
}
