import 'package:json_annotation/json_annotation.dart';

part 'personagem.g.dart';

@JsonSerializable()
class Personagem {
  @JsonKey(name: "personagemId")
  final int id;

  final String foto;

  Personagem(this.id, this.foto);

  factory Personagem.fromJson(Map<String, dynamic> json) =>
      _$PersonagemFromJson(json);

  Map<String, dynamic> toJson() => _$PersonagemToJson(this);
}
