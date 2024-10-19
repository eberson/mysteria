import 'package:json_annotation/json_annotation.dart';

part 'adivinha_request.g.dart';

@JsonSerializable()
class AdivinhaRequest {
  final String partidaId;
  final String jogadorId;
  final int personagemId;
  final int objetoId;
  final int localId;

  AdivinhaRequest(
    this.partidaId,
    this.jogadorId,
    this.personagemId,
    this.objetoId,
    this.localId,
  );

  factory AdivinhaRequest.fromJson(Map<String, dynamic> json) =>
      _$AdivinhaRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AdivinhaRequestToJson(this);
}
