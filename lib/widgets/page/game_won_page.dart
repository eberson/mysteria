import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:mysteria/util/animations.dart';
import 'package:mysteria/util/images.dart';
import 'package:mysteria/util/partida_reset.dart';
import 'package:mysteria/widgets/botao.dart';
import 'package:mysteria/widgets/stack_container.dart';
import 'package:mysteria/widgets/texto_sublinhado.dart';

class GameWonPage extends StatelessWidget {
  const GameWonPage({super.key});

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => resetPartida(context),
    );

    return Scaffold(
      body: StackContainer(
        child: Center(
          child: Column(
            children: [
              Image.asset(Images.faixaDestaque),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: Center(
                  child: Lottie.asset(Animations.won),
                ),
              ),
              Container(
                width: 300,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                ),
                child: Column(
                  children: [
                    Botao(
                      onPress: () => Navigator.pop(context),
                      child: const TextoSublinhado("SAIR"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
