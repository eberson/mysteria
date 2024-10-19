import 'package:flutter/material.dart';
import 'package:mysteria/entidade/partida.dart';
import 'package:mysteria/util/images.dart';
import 'package:mysteria/vm/game_vm.dart';
import 'package:mysteria/vm/local_vm.dart';
import 'package:mysteria/vm/objeto_vm.dart';
import 'package:mysteria/vm/partida_vm.dart';
import 'package:mysteria/vm/personagem_vm.dart';
import 'package:mysteria/widgets/botao.dart';
import 'package:mysteria/widgets/local_view.dart';
import 'package:mysteria/widgets/objeto_view.dart';
import 'package:mysteria/widgets/personagem_view.dart';
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

  Widget empty(BuildContext context) => Expanded(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextoSublinhado(
                "Não foi possível encontrar a partida. Volta e entre novamente, por favor.",
              ),
              const SizedBox(
                height: 20,
              ),
              Botao(
                child: const TextoSublinhado("VOLTAR"),
                onPress: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      );

  Widget body(BuildContext context, Partida partida) {
    const verticalSpacer = SizedBox(
      height: 12,
    );

    final sectionStyle = Theme.of(context).textTheme.headlineSmall?.copyWith(
          color: Colors.green,
        );

    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Headline(partida.titulo),
              verticalSpacer,
              Text(partida.narrativa),
              verticalSpacer,
              TextoSublinhado(
                "PERSONAGENS",
                style: sectionStyle,
              ),
              personagens(context),
              verticalSpacer,
              TextoSublinhado(
                "OBJETOS",
                style: sectionStyle,
              ),
              objetos(context),
              verticalSpacer,
              TextoSublinhado(
                "LOCAIS",
                style: sectionStyle,
              ),
              locais(context),
              verticalSpacer,
              Botao(
                child: const TextoSublinhado("DESCOBRI"),
                onPress: () async {
                  final personagem = personagemVM(context).personagemEscolhido;
                  final objeto = objetoVM(context).objetoEscolhido;
                  final local = localVM(context).localEscolhido;

                  if (personagem == null || objeto == null || local == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Verifique se você marcou um personagem, objeto e local antes de adivinhar!",
                        ),
                      ),
                    );

                    return;
                  }

                  final message = await gameVM(context).adivinha(
                    personagem,
                    local,
                    objeto,
                  );

                  if (context.mounted) {
                    if (message.error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message.message),
                        ),
                      );
                    } else {
                      //go to Victory Screen
                    }
                  }
                },
              ),
              verticalSpacer,
              Botao(
                child: const TextoSublinhado("TENTAR NOVAMENTE"),
                onPress: () {
                  personagemVM(context).reset();
                  objetoVM(context).reset();
                  localVM(context).reset();
                },
              ),
              verticalSpacer,
              Botao(
                child: const TextoSublinhado("VOLTAR"),
                onPress: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget personagens(BuildContext context) {
    final vm = Provider.of<PersonagemViewModel>(context);
    final personagens = vm.personagens;

    return SizedBox(
      height: 550,
      width: double.maxFinite,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: personagens.length,
        itemBuilder: (context, index) => PersonagemView(
          personagem: personagens[index],
        ),
      ),
    );
  }

  Widget objetos(BuildContext context) {
    final vm = Provider.of<ObjetoViewModel>(context);
    final objetos = vm.objetos;

    return SizedBox(
      height: 550,
      width: double.maxFinite,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: objetos.length,
        itemBuilder: (context, index) => ObjetoView(
          objeto: objetos[index],
        ),
      ),
    );
  }

  Widget locais(BuildContext context) {
    final vm = Provider.of<LocalViewModel>(context);
    final locais = vm.locais;

    return SizedBox(
      height: 550,
      width: double.maxFinite,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: locais.length,
        itemBuilder: (context, index) => LocalView(
          local: locais[index],
        ),
      ),
    );
  }

  PersonagemViewModel personagemVM(BuildContext context) =>
      Provider.of<PersonagemViewModel>(context, listen: false);

  LocalViewModel localVM(BuildContext context) =>
      Provider.of<LocalViewModel>(context, listen: false);

  ObjetoViewModel objetoVM(BuildContext context) =>
      Provider.of<ObjetoViewModel>(context, listen: false);

  GameViewModel gameVM(BuildContext context) =>
      Provider.of<GameViewModel>(context, listen: false);
}
