import 'package:flutter/foundation.dart';
import 'package:mysteria/entidade/partida.dart';
import 'package:mysteria/entidade/status_partida.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class PartidaListViewModel extends ChangeNotifier {
  List<Partida> _partidas = <Partida>[];

  void refresh() {
    _partidas = <Partida>[
      Partida(
        id: _uuid.v7(),
        name: "Partida 1",
        status: StatusPartida.aguardando,
        maxJogadores: 10,
        countJogadores: 5,
      ),
      Partida(
        id: _uuid.v7(),
        name: "Partida 2",
        status: StatusPartida.andamento,
        maxJogadores: 10,
        countJogadores: 10,
      ),
      Partida(
        id: _uuid.v7(),
        name: "Partida 3",
        status: StatusPartida.aguardando,
        maxJogadores: 10,
        countJogadores: 4,
      ),
    ];

    notifyListeners();
  }

  List<Partida> get partidas => _partidas;

  static ChangeNotifierProvider<PartidaListViewModel> create() =>
      ChangeNotifierProvider(
        create: (_) => PartidaListViewModel(),
      );
}
