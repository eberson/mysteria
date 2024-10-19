import 'package:json_annotation/json_annotation.dart';

enum StatusPartida {
  @JsonValue("EmAndamento")
  andamento("Em Andamento"),
  @JsonValue("Aguardando")
  aguardando("Aguardando"),
  @JsonValue("Finalizada")
  finalizada("Finalizada");

  final String description;

  const StatusPartida(this.description);

  String toJson() {
    switch (this) {
      case StatusPartida.andamento:
        return "EmAndamento";
      case StatusPartida.aguardando:
        return "Aguardando";
      case StatusPartida.finalizada:
        return "Finalizada";
    }
  }
}
