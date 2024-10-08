import 'package:flutter/material.dart';

class TextoSublinhado extends StatelessWidget {
  final String content;
  final TextStyle? style;

  const TextoSublinhado({
    super.key,
    required this.content,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final currentStyle = style ?? tema.textTheme.bodyMedium;

    return Text(
      content,
      style: currentStyle?.copyWith(
        decoration: TextDecoration.underline,
      ),
    );
  }
}
