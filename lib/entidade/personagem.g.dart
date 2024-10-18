// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personagem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Personagem _$PersonagemFromJson(Map<String, dynamic> json) => Personagem(
      (json['personagemId'] as num).toInt(),
      json['foto'] as String,
    );

Map<String, dynamic> _$PersonagemToJson(Personagem instance) =>
    <String, dynamic>{
      'personagemId': instance.id,
      'foto': instance.foto,
    };
