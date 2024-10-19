import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:mysteria/entidade/personagem.dart';
import 'package:provider/provider.dart';

class PersonagemViewModel extends ChangeNotifier {
  final List<Personagem> _todos = [];
  final List<Personagem> _excluidos = [];
  Personagem? _escolhido;

  void seleciona(Personagem personagem) {
    _excluidos.clear();

    _todos
        .where((p) => p.id != personagem.id)
        .forEach((p) => _excluidos.add(p));

    _escolhido = personagem;

    _debug();

    notifyListeners();
  }

  void exclui(Personagem personagem) {
    if (_escolhido?.id == personagem.id) {
      _escolhido = null;
    }

    if (!_excluidos.contains(personagem)) {
      _excluidos.add(personagem);
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

  void start(List<Personagem> personagens) {
    _todos.clear();
    _todos.addAll(personagens);

    notifyListeners();
  }

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

  List<Personagem> get personagens {
    if (_escolhido != null) {
      return <Personagem>[_escolhido!];
    }

    return _todos.where((p) => !_excluidos.any((pi) => pi.id == p.id)).toList();
  }

  Personagem? personagemEscolhido;

  static ChangeNotifierProvider<PersonagemViewModel> create() =>
      ChangeNotifierProvider(
        create: (_) => PersonagemViewModel(),
      );
}
