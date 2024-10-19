import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:mysteria/entidade/objeto.dart';
import 'package:mysteria/entidade/partida.dart';
import 'package:provider/provider.dart';

class ObjetoViewModel extends ChangeNotifier {
  final List<Objeto> _todos = [];
  final List<Objeto> _excluidos = [];
  Objeto? _escolhido;

  void seleciona(Objeto objeto) {
    _excluidos.clear();

    _todos.where((p) => p.id != objeto.id).forEach((p) => _excluidos.add(p));

    _escolhido = objeto;

    _debug();

    notifyListeners();
  }

  void exclui(Objeto objeto) {
    if (_escolhido?.id == objeto.id) {
      _escolhido = null;
    }

    if (!_excluidos.contains(objeto)) {
      _excluidos.add(objeto);
    }

    if (_todos.length == _excluidos.length) {
      _excluidos.clear();
    }

    _debug();

    notifyListeners();
  }

  void _debug() {
    log("personagemEscolhido: ${_escolhido?.foto}");

    for (var p in _excluidos) {
      log("personagemExlcuido: ${p.foto}");
    }
  }

  void start(List<Objeto> objetos) {
    _todos.clear();
    _todos.addAll(objetos);

    notifyListeners();
  }

  List<Objeto> get objetos {
    if (_escolhido != null) {
      return <Objeto>[_escolhido!];
    }

    return _todos.where((p) => !_excluidos.any((pi) => pi.id == p.id)).toList();
  }

  void reset() {
    _escolhido = null;
    _excluidos.clear();

    notifyListeners();
  }

  Objeto? get objetoEscolhido => _escolhido;

  static ChangeNotifierProvider<ObjetoViewModel> create() =>
      ChangeNotifierProvider(
        create: (_) => ObjetoViewModel(),
      );
}
