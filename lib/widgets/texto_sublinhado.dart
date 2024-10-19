import 'package:flutter/material.dart';

class TextoSublinhado extends StatelessWidget {
  final String content;
  final TextStyle? style;
  final TextAlign? textAlign;

  const TextoSublinhado(
    this.content, {
    super.key,
    this.style,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final currentStyle = style ?? tema.textTheme.bodyMedium;

    return Text(
      content,
      textAlign: textAlign ?? TextAlign.center,
      style: currentStyle?.copyWith(
        decoration: TextDecoration.underline,
      ),
    );
  }
}
