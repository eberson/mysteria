import 'package:json_annotation/json_annotation.dart';
import 'package:mysteria/entidade/status_partida.dart';

part 'partida_resumida.g.dart';

@JsonSerializable()
class PartidaResumida {
  final String id;
  final String titulo;
  final int quantidadeJogadores;
  final StatusPartida status = StatusPartida.aguardando;

  PartidaResumida(this.id, this.titulo, this.quantidadeJogadores);

  bool get disponivel => countJogadores < maxJogadores;

  int get maxJogadores => 10;
  int get countJogadores => quantidadeJogadores;

  factory PartidaResumida.fromJson(Map<String, dynamic> json) =>
      _$PartidaResumidaFromJson(json);

  Map<String, dynamic> toJson() => _$PartidaResumidaToJson(this);
}
