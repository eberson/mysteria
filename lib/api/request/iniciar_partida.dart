import 'package:json_annotation/json_annotation.dart';

part 'iniciar_partida.g.dart';

@JsonSerializable()
class IniciarPartida {
  @JsonKey(name: "partidaId")
  final String id;

  IniciarPartida(this.id);

  factory IniciarPartida.fromJson(Map<String, dynamic> json) =>
      _$IniciarPartidaFromJson(json);

  Map<String, dynamic> toJson() => _$IniciarPartidaToJson(this);
}
