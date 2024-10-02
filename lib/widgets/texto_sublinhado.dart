import 'package:flutter/material.dart';

class TextoSublinhado extends StatelessWidget {
  final String content;

  const TextoSublinhado({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    return Text(
      content,
      style: tema.textTheme.bodyMedium?.copyWith(
        decoration: TextDecoration.underline,
      ),
    );
  }
}
