import 'package:flutter/foundation.dart';
import 'package:mysteria/entidade/jogador.dart';
import 'package:mysteria/entidade/partida.dart';
import 'package:provider/provider.dart';

class PartidaViewModel extends ChangeNotifier {
  late Partida _partida;
  List<Jogador> _jogadores = [];

  void setPartida(Partida partida) {
    _partida = partida;

    carregaJogadores();

    notifyListeners();
  }

  void carregaJogadores() {
    _jogadores = <Jogador>[
      Jogador.comNome("Clara"),
      Jogador.comNome("João"),
      Jogador.comNome("Aline"),
    ];

    notifyListeners();
  }

  Partida get partida => _partida;
  List<Jogador> get jogadores => _jogadores;

  static ChangeNotifierProvider<PartidaViewModel> create() =>
      ChangeNotifierProvider(
        create: (_) => PartidaViewModel(),
      );
}
