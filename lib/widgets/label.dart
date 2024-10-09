import 'package:flutter/material.dart';
import 'package:mysteria/widgets/texto_sublinhado.dart';

class Label extends StatelessWidget {
  final String text;
  final String? imageAsset;

  const Label(this.text, {super.key, this.imageAsset});

  @override
  Widget build(BuildContext context) {
    if (imageAsset == null) {
      return TextoSublinhado(text);
    }

    return Row(
      children: [
        TextoSublinhado(text),
        const SizedBox(
          width: 5,
        ),
        Image.asset(
          imageAsset!,
          width: 24,
          height: 24,
        ),
      ],
    );
  }
}
