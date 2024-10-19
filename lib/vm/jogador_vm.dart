import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:mysteria/api/request/adicionar_jogador.dart';
import 'package:mysteria/api/rest_client.dart';
import 'package:mysteria/entidade/jogador.dart';
import 'package:mysteria/entidade/partida_resumida.dart';
import 'package:provider/provider.dart';

class JogadorViewModel extends ChangeNotifier {
  Jogador? _jogador;

  void createJogador(String? nome) {
    _jogador = Jogador.comNome(nome);
    notifyListeners();
  }

  Future<void> adicionarNaPartida(PartidaResumida partida) async {
    if (_jogador == null) {
      return Future.error(
        "Não existe jogador configurado. Saia e entre novamente, por favor.",
      );
    }

    try {
      final id = await RestClient.instance.adicionarJogador(
        AdicionarJogador(
          partida.id,
          jogador!.nome,
        ),
      );

      _jogador = Jogador(
        id: id.replaceAll(RegExp(r'"+'), ""),
        nome: jogador!.nome,
      );

      notifyListeners();
    } catch (e) {
      log("erro adicionando jogador: $e");
      return Future.error("Não foi possível entrar na partida");
    }
  }

  Future<void> removerDaPartida(String partidaId) async {
    if (_jogador == null) {
      return Future.error(
        "Não existe jogador configurado. Saia e entre novamente, por favor.",
      );
    }

    try {
      await RestClient.instance.removerJogador(
        partidaId,
        _jogador!.id,
      );

      notifyListeners();
    } catch (e) {
      log("erro removendo jogador: $e");
      return Future.error("Erro ao sair da partida");
    }
  }

  Jogador? get jogador => _jogador;

  static ChangeNotifierProvider<JogadorViewModel> create() =>
      ChangeNotifierProvider(create: (_) => JogadorViewModel());
}
