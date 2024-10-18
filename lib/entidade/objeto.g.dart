// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'objeto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Objeto _$ObjetoFromJson(Map<String, dynamic> json) => Objeto(
      (json['objetoId'] as num).toInt(),
      json['foto'] as String,
    );

Map<String, dynamic> _$ObjetoToJson(Objeto instance) => <String, dynamic>{
      'objetoId': instance.id,
      'foto': instance.foto,
    };
