import 'package:json_annotation/json_annotation.dart';
import 'package:mysteria/util/ints.dart';
import 'package:uuid/uuid.dart';

part 'jogador.g.dart';

const _uuid = Uuid();

@JsonSerializable()
class Jogador {
  final String id;
  final String nome;

  Jogador({
    required this.id,
    required this.nome,
  });

  factory Jogador.comNome(String? nome) {
    if (nome == null || nome.isEmpty) {
      return Jogador.comNomePadrao();
    }

    return Jogador(id: _uuid.v7(), nome: nome);
  }

  factory Jogador.comNomePadrao() {
    final now = DateTime.now();

    return Jogador(
      id: _uuid.v7(),
      nome:
          "Jogador ${now.second.toDigitCount(2)}${now.millisecond.toDigitCount(3)}",
    );
  }

  factory Jogador.fromJson(Map<String, dynamic> json) =>
      _$JogadorFromJson(json);

  Map<String, dynamic> toJson() => _$JogadorToJson(this);
}
