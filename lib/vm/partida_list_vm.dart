import 'package:flutter/foundation.dart';
import 'package:mysteria/api/rest_client.dart';
import 'package:mysteria/entidade/partida_resumida.dart';
import 'package:mysteria/entidade/status_partida.dart';
import 'package:provider/provider.dart';

class PartidaListViewModel extends ChangeNotifier {
  List<PartidaResumida> _partidas = <PartidaResumida>[];

  void refresh() {
    RestClient.instance
        .listaPartidasPorStatus(StatusPartida.aguardando)
        .then((items) {
      _partidas = items;
      notifyListeners();
    });
  }

  List<PartidaResumida> get partidas => _partidas;

  static ChangeNotifierProvider<PartidaListViewModel> create() =>
      ChangeNotifierProvider(
        create: (_) => PartidaListViewModel(),
      );
}
