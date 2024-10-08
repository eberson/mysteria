import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class Jogador {
  final String id;
  final String nome;

  Jogador._({
    required this.id,
    required this.nome,
  });

  factory Jogador.comNome(String? nome) {
    if (nome == null || nome.isEmpty) {
      return Jogador.comNomePadrao();
    }

    return Jogador._(id: _uuid.v7(), nome: nome);
  }

  factory Jogador.comNomePadrao() {
    return Jogador._(
      id: _uuid.v7(),
      nome: "Jogador ${DateTime.now().millisecondsSinceEpoch}",
    );
  }
}
