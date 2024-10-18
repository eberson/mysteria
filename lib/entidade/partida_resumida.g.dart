// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partida_resumida.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartidaResumida _$PartidaResumidaFromJson(Map<String, dynamic> json) =>
    PartidaResumida(
      json['id'] as String,
      json['titulo'] as String,
      (json['quantidadeJogadores'] as num).toInt(),
    );

Map<String, dynamic> _$PartidaResumidaToJson(PartidaResumida instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titulo': instance.titulo,
      'quantidadeJogadores': instance.quantidadeJogadores,
    };
