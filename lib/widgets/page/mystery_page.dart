import 'package:flutter/material.dart';
import 'package:mysteria/entidade/partida.dart';
import 'package:mysteria/util/images.dart';
import 'package:mysteria/vm/partida_vm.dart';
import 'package:mysteria/widgets/botao.dart';
import 'package:mysteria/widgets/headline.dart';
import 'package:mysteria/widgets/stack_container.dart';
import 'package:mysteria/widgets/texto_sublinhado.dart';
import 'package:provider/provider.dart';

class MysteryPage extends StatelessWidget {
  const MysteryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final partidaVM = Provider.of<PartidaViewModel>(context);
    final partida = partidaVM.partida;

    return Scaffold(
      body: StackContainer(
        child: Center(
          child: Column(children: [
            Image.asset(Images.faixaDestaque),
            partida == null ? empty(context) : body(context, partida),
          ]),
        ),
      ),
    );
  }

  Widget empty(BuildContext context) => Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const TextoSublinhado(
              "Não foi possível encontrar a partida. Volta e entre novamente, por favor.",
            ),
            Botao(
              child: const TextoSublinhado("Voltar"),
              onPress: () => Navigator.pop(context),
            ),
          ],
        ),
      );

  Widget body(BuildContext context, Partida partida) {
    return const Placeholder();
  }
}
