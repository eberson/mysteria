import 'package:flutter/material.dart';
import 'package:mysteria/widgets/botao.dart';
import 'package:mysteria/widgets/container_tela.dart';
import 'package:mysteria/widgets/texto_sublinhado.dart';

class PartidasPage extends StatelessWidget {
  const PartidasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    return Scaffold(
      body: ContainerTela(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30, bottom: 15),
              child: TextoSublinhado(
                content: "PARTIDAS",
                style: tema.textTheme.headlineMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 30,
                left: 12,
                right: 12,
                top: 12,
              ),
              child: Botao(
                child: const TextoSublinhado(content: "ATUALIZAR"),
                onPress: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
