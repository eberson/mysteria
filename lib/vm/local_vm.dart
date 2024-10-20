import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:mysteria/entidade/local.dart';
import 'package:provider/provider.dart';

class LocalViewModel extends ChangeNotifier {
  final List<Local> _todos = [];
  final List<Local> _excluidos = [];
  Local? _escolhido;

  void seleciona(Local local) {
    _excluidos.clear();

    _todos.where((p) => p.id != local.id).forEach((p) => _excluidos.add(p));

    _escolhido = local;

    _debug();

    notifyListeners();
  }

  void exclui(Local local) {
    if (_escolhido?.id == local.id) {
      _escolhido = null;
    }

    if (!_excluidos.contains(local)) {
      _excluidos.add(local);
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

  void start(List<Local> locais) {
    _todos.clear();
    _todos.addAll(locais);

    notifyListeners();
  }

  List<Local> get locais {
    if (_escolhido != null) {
      return <Local>[_escolhido!];
    }

    return _todos.where((p) => !_excluidos.any((pi) => pi.id == p.id)).toList();
  }

  Local? get localEscolhido => _escolhido;

  void tryAgain() {
    _escolhido = null;
    _excluidos.clear();

    notifyListeners();
  }

  void reset() {
    _escolhido = null;
    _excluidos.clear();
    _todos.clear();

    notifyListeners();
  }

  static ChangeNotifierProvider<LocalViewModel> create() =>
      ChangeNotifierProvider(
        create: (_) => LocalViewModel(),
      );
}
