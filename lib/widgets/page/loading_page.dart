import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mysteria/util/animations.dart';
import 'package:mysteria/util/images.dart';
import 'package:mysteria/widgets/headline.dart';
import 'package:mysteria/widgets/stack_container.dart';

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
      await Future.delayed(const Duration(seconds: 3));

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
