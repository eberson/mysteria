import 'package:flutter/foundation.dart';
import 'package:mysteria/api/request/adivinha_request.dart';
import 'package:mysteria/api/rest_client.dart';
import 'package:mysteria/entidade/charada.dart';
import 'package:mysteria/entidade/jogador.dart';
import 'package:mysteria/entidade/local.dart';
import 'package:mysteria/entidade/objeto.dart';
import 'package:mysteria/entidade/partida.dart';
import 'package:mysteria/entidade/personagem.dart';
import 'package:mysteria/vm/model/message.dart';
import 'package:provider/provider.dart';

class GameViewModel extends ChangeNotifier {
  final List<Charada> _todas = [];
  final List<Charada> _coletadas = [];

  Jogador? _jogador;
  Partida? _partida;

  void start(Partida partida, Jogador jogador) {
    _todas.clear();
    _todas.addAll(partida.dicas);

    _partida = partida;
    _jogador = jogador;

    _coletadas.clear();
    notifyListeners();
  }

  void addCharadaColetada(Charada charada) {
    _coletadas.add(charada);
    notifyListeners();
  }

  Future<Message> adivinha(
    Personagem personagem,
    Local local,
    Objeto objeto,
  ) async {
    if (_partida == null || _jogador == null) {
      return Message.error(
        "Ops, deu algum erro aqui. Saia e entre novamente no jogo!",
      );
    }

    try {
      await RestClient.instance.adivinhar(
        AdivinhaRequest(
          _partida!.id,
          _jogador!.id,
          personagem.id,
          objeto.id,
          local.id,
        ),
      );

      return Message.success("Parabéns, você desvendou o mistério");
    } catch (e) {
      return Message.error("Que pena você errou. Tente novamente!");
    }
  }

  void reset() {
    _todas.clear();
    _coletadas.clear();

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
