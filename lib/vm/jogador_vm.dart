import 'package:flutter/foundation.dart';
import 'package:mysteria/api/request/adicionar_jogador.dart';
import 'package:mysteria/api/rest_client.dart';
import 'package:mysteria/entidade/jogador.dart';
import 'package:mysteria/entidade/partida_resumida.dart';
import 'package:mysteria/vm/model/message.dart';
import 'package:provider/provider.dart';

class JogadorViewModel extends ChangeNotifier {
  Jogador? _jogador;

  void createJogador(String? nome) {
    _jogador = Jogador.comNome(nome);
    notifyListeners();
  }

  Future<Message> adicionarNaPartida(PartidaResumida partida) async {
    if (_jogador == null) {
      return Future.error(
        "Não existe jogador configurado. Saia e entre novamente, por favor.",
      );
    }

    try {
      final message = await RestClient.instance.adicionarJogador(
        AdicionarJogador(
          partida.id,
          jogador!.nome,
        ),
      );

      return Message.success(message);
    } catch (e) {
      return Message.error(e.toString());
    }
  }

  Jogador? get jogador => _jogador;

  static ChangeNotifierProvider<JogadorViewModel> create() =>
      ChangeNotifierProvider(create: (_) => JogadorViewModel());
}
