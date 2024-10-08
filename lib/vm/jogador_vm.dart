import 'package:flutter/foundation.dart';
import 'package:mysteria/entidade/jogador.dart';
import 'package:provider/provider.dart';

class JogadorViewModel extends ChangeNotifier {
  late Jogador _jogador;

  void createJogador(String? nome) {
    _jogador = Jogador.comNome(nome);
    notifyListeners();
  }

  Jogador get jogador => _jogador;

  static ChangeNotifierProvider<JogadorViewModel> create() =>
      ChangeNotifierProvider(create: (_) => JogadorViewModel());
}
