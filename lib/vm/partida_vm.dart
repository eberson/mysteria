import 'package:flutter/foundation.dart';
import 'package:mysteria/api/request/iniciar_partida.dart';
import 'package:mysteria/api/rest_client.dart';
import 'package:mysteria/entidade/jogador.dart';
import 'package:mysteria/entidade/partida.dart';
import 'package:provider/provider.dart';

class PartidaViewModel extends ChangeNotifier {
  Partida? _partida;

  Future<void> refresh() async {
    if (_partida == null) {
      return;
    }

    _partida = await RestClient.instance.getPartida(_partida!.id);

    if (_partida == null) {
      notifyListeners();
      return;
    }

    notifyListeners();
  }

  Future<void> iniciaPartida() async {
    if (_partida == null) {
      return;
    }

    try {
      await RestClient.instance.iniciarPartida(IniciarPartida(_partida!.id));
    } catch (e) {
      Future.error(e.toString());
    }
  }

  void reset() {
    _partida = null;
    notifyListeners();
  }

  Future<void> setPartida(String partida) async {
    _partida = await RestClient.instance.getPartida(partida);
    notifyListeners();
  }

  Partida? get partida => _partida;
  List<Jogador> get jogadores => _partida?.jogadores ?? [];

  static ChangeNotifierProvider<PartidaViewModel> create() =>
      ChangeNotifierProvider(
        create: (_) => PartidaViewModel(),
      );
}
