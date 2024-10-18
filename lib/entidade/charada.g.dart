// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charada.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Charada _$CharadaFromJson(Map<String, dynamic> json) => Charada(
      json['charada'] as String,
      (json['latitude'] as num).toDouble(),
      (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$CharadaToJson(Charada instance) => <String, dynamic>{
      'charada': instance.conteudo,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
