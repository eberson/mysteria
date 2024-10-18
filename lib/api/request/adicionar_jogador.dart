import 'package:json_annotation/json_annotation.dart';

part 'adicionar_jogador.g.dart';

@JsonSerializable()
class AdicionarJogador {
  final String partidaId;

  @JsonKey(name: "nome")
  final String nomeJogador;

  AdicionarJogador(this.partidaId, this.nomeJogador);

  factory AdicionarJogador.fromJson(Map<String, dynamic> json) =>
      _$AdicionarJogadorFromJson(json);

  Map<String, dynamic> toJson() => _$AdicionarJogadorToJson(this);
}
