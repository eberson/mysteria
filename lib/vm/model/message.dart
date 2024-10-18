class Message {
  final String message;
  final bool error;

  Message._(this.message, this.error);

  factory Message.error(String message) => Message._(message, true);
  factory Message.success(String message) => Message._(message, false);
}
