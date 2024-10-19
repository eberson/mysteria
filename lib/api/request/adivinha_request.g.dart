// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adivinha_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdivinhaRequest _$AdivinhaRequestFromJson(Map<String, dynamic> json) =>
    AdivinhaRequest(
      json['partidaId'] as String,
      json['jogadorId'] as String,
      (json['personagemId'] as num).toInt(),
      (json['objetoId'] as num).toInt(),
      (json['localId'] as num).toInt(),
    );

Map<String, dynamic> _$AdivinhaRequestToJson(AdivinhaRequest instance) =>
    <String, dynamic>{
      'partidaId': instance.partidaId,
      'jogadorId': instance.jogadorId,
      'personagemId': instance.personagemId,
      'objetoId': instance.objetoId,
      'localId': instance.localId,
    };
