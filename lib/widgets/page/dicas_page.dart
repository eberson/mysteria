import 'package:flutter/material.dart';
import 'package:mysteria/entidade/charada.dart';
import 'package:mysteria/util/images.dart';
import 'package:mysteria/vm/game_vm.dart';
import 'package:mysteria/widgets/botao.dart';
import 'package:mysteria/widgets/headline.dart';
import 'package:mysteria/widgets/stack_container.dart';
import 'package:mysteria/widgets/texto_sublinhado.dart';
import 'package:provider/provider.dart';

class DicasPage extends StatelessWidget {
  const DicasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final gameVM = Provider.of<GameViewModel>(context);
    final dicas = gameVM.coletadas;

    return Scaffold(
      body: StackContainer(
        child: Center(
          child: Column(children: [
            Image.asset(Images.faixaDestaque),
            dicas.isEmpty ? empty(context) : body(context, dicas),
          ]),
        ),
      ),
    );
  }

  Widget empty(BuildContext context) {
    const verticalSpacer = SizedBox(
      height: 12,
    );

    return Expanded(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextoSublinhado(
              "Nenhuma dica coletada.",
            ),
            verticalSpacer,
            Botao(
              child: const TextoSublinhado("VER MISTÉRIO"),
              onPress: () => Navigator.pushNamed(context, "/mystery"),
            ),
            verticalSpacer,
            Botao(
              child: const TextoSublinhado("VOLTAR"),
              onPress: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget body(BuildContext context, List<Charada> charadas) {
    const verticalSpacer = SizedBox(
      height: 12,
    );

    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              const Headline("DICAS COLETADAS"),
              verticalSpacer,
              dicas(context, charadas),
              verticalSpacer,
              Botao(
                child: const TextoSublinhado("VER MISTÉRIO"),
                onPress: () => Navigator.pushNamed(context, "/mystery"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dicas(BuildContext context, List<Charada> charadas) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      scrollDirection: Axis.horizontal,
      itemCount: charadas.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: TextoSublinhado(charadas[index].conteudo),
      ),
    );
  }
}
