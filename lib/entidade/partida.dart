import 'package:mysteria/entidade/status_partida.dart';

class Partida {
  final String id;
  final String name;
  final StatusPartida status;

  final int maxJogadores;
  final int countJogadores;

  Partida({
    required this.id,
    required this.name,
    required this.status,
    required this.maxJogadores,
    required this.countJogadores,
  });

  bool get disponivel => countJogadores < maxJogadores;
}
