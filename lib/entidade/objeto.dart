import 'package:json_annotation/json_annotation.dart';

part 'objeto.g.dart';

@JsonSerializable()
class Objeto {
  @JsonKey(name: "objetoId")
  final int id;

  final String foto;

  Objeto(this.id, this.foto);

  factory Objeto.fromJson(Map<String, dynamic> json) =>
      _$ObjetoFromJson(json);

  Map<String, dynamic> toJson() => _$ObjetoToJson(this);
}
