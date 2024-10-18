import 'package:json_annotation/json_annotation.dart';

part 'local.g.dart';

@JsonSerializable()
class Local {
  @JsonKey(name: "localId")
  final int id;

  final String foto;

  Local(this.id, this.foto);

  factory Local.fromJson(Map<String, dynamic> json) => _$LocalFromJson(json);

  Map<String, dynamic> toJson() => _$LocalToJson(this);
}
