// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Local _$LocalFromJson(Map<String, dynamic> json) => Local(
      (json['localId'] as num).toInt(),
      json['foto'] as String,
    );

Map<String, dynamic> _$LocalToJson(Local instance) => <String, dynamic>{
      'localId': instance.id,
      'foto': instance.foto,
    };
