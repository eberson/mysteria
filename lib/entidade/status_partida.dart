enum StatusPartida {
  andamento("Em Andamento"),
  aguardando("Aguardando"),
  finalizada("Finalizada");

  final String description;

  const StatusPartida(this.description);
}
