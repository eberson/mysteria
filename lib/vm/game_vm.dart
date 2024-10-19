import 'package:flutter/foundation.dart';
import 'package:mysteria/entidade/charada.dart';
import 'package:provider/provider.dart';

class GameViewModel extends ChangeNotifier {
  final List<Charada> _todas = [];
  final List<Charada> _coletadas = [];

  void start(List<Charada> charadas) {
    _todas.clear();
    _todas.addAll(charadas);

    _coletadas.clear();
    notifyListeners();
  }

  void addCharadaColetada(Charada charada) {
    _coletadas.add(charada);
    notifyListeners();
  }

  int get dicasColetadas => _coletadas.length;
  List<Charada> get todas => _todas;
  List<Charada> get coletadas => _coletadas;

  static ChangeNotifierProvider<GameViewModel> create() =>
      ChangeNotifierProvider(
        create: (_) => GameViewModel(),
      );
}
