import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:mysteria/geo/location.dart';
import 'package:provider/provider.dart';

class PontoInteresseViewModel extends ChangeNotifier {
  late LatLng? _jogador;
  List<LatLng> _locais = [];
  List<LatLng> _proximos = [];

  void setUserLocation(LatLng point) {
    _jogador = point;
    onMove();
    notifyListeners();
  }

  void setLocais(List<LatLng> locais) {
    _locais = locais;
    onMove();
    notifyListeners();
  }

  void onMove() {
    if (_jogador == null) {
      return;
    }

    _proximos = _locais
        .where((l) => getDistanceFromLatLonInMeters(_jogador!, l) < 15)
        .toList();
  }

  LatLng? get jogador => _jogador;
  List<LatLng> get pontosProximos => _proximos;

  static ChangeNotifierProvider<PontoInteresseViewModel> create() =>
      ChangeNotifierProvider(
        create: (_) => PontoInteresseViewModel(),
      );
}
