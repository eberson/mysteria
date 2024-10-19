import 'package:json_annotation/json_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'charada.g.dart';

@JsonSerializable()
class Charada {
  @JsonKey(name: "charada")
  final String conteudo;
  final double latitude;
  final double longitude;

  Charada(this.conteudo, this.latitude, this.longitude);

  LatLng get coord => LatLng(latitude, longitude);

  factory Charada.fromJson(Map<String, dynamic> json) =>
      _$CharadaFromJson(json);

  Map<String, dynamic> toJson() => _$CharadaToJson(this);
}
