import 'package:json_annotation/json_annotation.dart';

enum StatusPartida {
  @JsonValue(2)
  andamento("Em Andamento"),
  @JsonValue(1)
  aguardando("Aguardando"),
  @JsonValue(3)
  finalizada("Finalizada");

  final String description;

  const StatusPartida(this.description);

  String toJson() {
    switch (this) {
      case StatusPartida.andamento:
        return "2";
      case StatusPartida.aguardando:
        return "1";
      case StatusPartida.finalizada:
        return "3";
    }
  }
}
