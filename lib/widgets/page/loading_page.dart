import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mysteria/util/animations.dart';
import 'package:mysteria/util/images.dart';
import 'package:mysteria/vm/game_vm.dart';
import 'package:mysteria/vm/local_vm.dart';
import 'package:mysteria/vm/objeto_vm.dart';
import 'package:mysteria/vm/partida_vm.dart';
import 'package:mysteria/vm/personagem_vm.dart';
import 'package:mysteria/widgets/headline.dart';
import 'package:mysteria/widgets/stack_container.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.jaldi(
      fontSize: 18,
    );

    const verticalSpacer = SizedBox(
      height: 20,
    );

    WidgetsBinding.instance.addPostFrameCallback(buildLoading(context));

    return Scaffold(
      body: StackContainer(
        child: Center(
          child: Column(
            children: [
              Image.asset(Images.faixaDestaque),
              const Headline("INICIANDO PARTIDA"),
              verticalSpacer,
              Lottie.asset(Animations.loading),
              verticalSpacer,
              Text(
                "Aguarde",
                style: textStyle,
              ),
              Text(
                "Estamos iniciando a partida...",
                style: textStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  FrameCallback buildLoading(BuildContext context) {
    return (Duration _) async {
      final partidaVM = Provider.of<PartidaViewModel>(context, listen: false);

      final personagemVM = Provider.of<PersonagemViewModel>(
        context,
        listen: false,
      );

      final objetoVM = Provider.of<ObjetoViewModel>(context, listen: false);
      final localVM = Provider.of<LocalViewModel>(context, listen: false);
      final gameVM = Provider.of<GameViewModel>(context, listen: false);

      personagemVM.start(partidaVM.partida?.personagens ?? []);
      objetoVM.start(partidaVM.partida?.objetos ?? []);
      localVM.start(partidaVM.partida?.locais ?? []);
      gameVM.start(partidaVM.partida?.dicas ?? []);

      await Future.delayed(const Duration(seconds: 1));

      if (context.mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/game",
          (route) => route.settings.name == "/",
        );
      }
    };
  }
}
