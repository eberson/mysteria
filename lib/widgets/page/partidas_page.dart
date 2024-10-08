import 'package:flutter/material.dart';
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
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextoSublinhado(
                    content: "PARTIDAS",
                    style: tema.textTheme.headlineMedium,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.refresh,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
