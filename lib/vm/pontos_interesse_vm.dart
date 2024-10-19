import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:mysteria/entidade/charada.dart';
import 'package:mysteria/geo/location.dart';
import 'package:provider/provider.dart';

class PontoInteresseViewModel extends ChangeNotifier {
  late LatLng? _jogador;
  final Map<LatLng, Charada> _charadas = {};
  final List<LatLng> _proximos = [];
  final List<LatLng> _coletaveis = [];

  void setUserLocation(LatLng point) {
    _jogador = point;
    notifyListeners();
  }

  void start(List<Charada> dicas) {
    _charadas.clear();

    dicas.add(
      Charada(
        "Teste de atualização de posição",
        -21.6047875,
        -48.3676916,
      ),
    );

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

    _coletaveis.clear();
    _coletaveis.addAll(
      _charadas.keys
          .where((l) => getDistanceFromLatLonInMeters(_jogador!, l) < 3)
          .toList(),
    );

    _proximos.clear();
    _proximos.addAll(
      _charadas.keys
          .where((l) =>
              getDistanceFromLatLonInMeters(_jogador!, l) < 15 &&
              _coletaveis.contains(l))
          .toList(),
    );
  }

  void reset() {
    _charadas.clear();
    _coletaveis.clear();
    _proximos.clear();
  }

  LatLng? get jogador => _jogador;
  List<LatLng> get pontosProximos => _proximos;
  List<LatLng> get pontosColetaveis => _coletaveis;

  static ChangeNotifierProvider<PontoInteresseViewModel> create() =>
      ChangeNotifierProvider(
        create: (_) => PontoInteresseViewModel(),
      );
}
