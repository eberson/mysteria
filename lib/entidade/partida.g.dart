// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partida.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Partida _$PartidaFromJson(Map<String, dynamic> json) => Partida(
      json['id'] as String,
      json['titulo'] as String,
      json['narrativa'] as String,
      json['dataHoraInicio'] == null
          ? null
          : DateTime.parse(json['dataHoraInicio'] as String),
      json['dataHoraTermino'] == null
          ? null
          : DateTime.parse(json['dataHoraTermino'] as String),
      $enumDecode(_$StatusPartidaEnumMap, json['status']),
      (json['personagens'] as List<dynamic>)
          .map((e) => Personagem.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['objetos'] as List<dynamic>)
          .map((e) => Objeto.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['locais'] as List<dynamic>)
          .map((e) => Local.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['jogadores'] as List<dynamic>)
          .map((e) => Jogador.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['personagemCharadas'] as List<dynamic>)
          .map((e) => Charada.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['localCharadas'] as List<dynamic>)
          .map((e) => Charada.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['objetoCharadas'] as List<dynamic>)
          .map((e) => Charada.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PartidaToJson(Partida instance) => <String, dynamic>{
      'id': instance.id,
      'titulo': instance.titulo,
      'narrativa': instance.narrativa,
      'dataHoraInicio': instance.inicio?.toIso8601String(),
      'dataHoraTermino': instance.fim?.toIso8601String(),
      'status': instance.status,
      'personagens': instance.personagens,
      'objetos': instance.objetos,
      'locais': instance.locais,
      'jogadores': instance.jogadores,
      'personagemCharadas': instance.dicasPersonagem,
      'objetoCharadas': instance.dicasObjeto,
      'localCharadas': instance.dicasLocal,
    };

const _$StatusPartidaEnumMap = {
  StatusPartida.andamento: 'EmAndamento',
  StatusPartida.aguardando: 'Aguardando',
  StatusPartida.finalizada: 'Finalizada',
};
