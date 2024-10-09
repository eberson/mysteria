import 'package:flutter/material.dart';
import 'package:mysteria/widgets/texto_sublinhado.dart';

class Headline extends StatelessWidget {
  final String title;

  const Headline(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 15),
      child: TextoSublinhado(
        title,
        style: tema.textTheme.headlineMedium,
      ),
    );
  }
}
