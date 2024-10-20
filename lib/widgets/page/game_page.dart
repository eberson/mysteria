import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:mysteria/entidade/charada.dart';
import 'package:mysteria/geo/locator.dart';
import 'package:mysteria/util/images.dart';
import 'package:mysteria/util/ints.dart';
import 'package:mysteria/util/partida_reset.dart';
import 'package:mysteria/util/providers.dart';
import 'package:mysteria/vm/game_vm.dart';
import 'package:mysteria/widgets/botao.dart';
import 'package:mysteria/widgets/dica_view.dart';
import 'package:mysteria/widgets/stack_container.dart';
import 'package:mysteria/widgets/texto_sublinhado.dart';
import 'package:provider/provider.dart';
import 'package:timer_count_down/timer_count_down.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late Timer? _timer;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 2), (_) async {
      try {
        final position = await determinePosition();

        final ctx = context;

        if (ctx.mounted) {
          Providers.pontoInteresseVM(ctx).setUserLocation(
            LatLng(position.latitude, position.longitude),
          );

          try {
            if (await Providers.partidaVM(ctx).partidaFinalizada()) {
              goToGameOver();
            }
          } catch (e) {
            log("Error: $e");
            goToGameOver();
          }
        }
      } catch (e) {
        showError(e);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.julee(
      fontSize: 26,
      color: const Color.fromARGB(255, 216, 0, 0),
    );

    final screenSize = MediaQuery.of(context).size;
    final titleSize = screenSize.width - 40;
    final dicaViewWidth = (screenSize.width - 40) / 2;

    final gameVM = Provider.of<GameViewModel>(context);
    final dicasPersonagem = gameVM.partida?.dicasPersonagem ?? [];
    final dicasObjeto = gameVM.partida?.dicasObjeto ?? [];
    final dicasLocal = gameVM.partida?.dicasLocal ?? [];

    final titleStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Colors.green,
        );

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }

        Providers.jogadorVM(context).removerDaPartida(gameVM.partida?.id ?? "");
        resetPartida(context);
      },
      child: Scaffold(
        body: StackContainer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    Images.mysteriaName,
                    width: titleSize,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Tempo Restante: ",
                      style: textStyle,
                    ),
                    Countdown(
                      seconds: 590,
                      build: (_, double time) {
                        final d = Duration(
                          seconds: time.toInt(),
                        );

                        return Text(
                          "${d.inMinutes.toClockPart()}:${d.inSeconds.toClockPart()}",
                          style: textStyle,
                        );
                      },
                      onFinished: () => goToGameOver(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextoSublinhado(
                  "PERSONAGEM",
                  style: titleStyle,
                ),
                showDica(dicasPersonagem, dicaViewWidth),
                const SizedBox(
                  height: 20,
                ),
                TextoSublinhado(
                  "OBJETO",
                  style: titleStyle,
                ),
                showDica(dicasObjeto, dicaViewWidth),
                const SizedBox(
                  height: 20,
                ),
                TextoSublinhado(
                  "LOCAL",
                  style: titleStyle,
                ),
                showDica(dicasLocal, dicaViewWidth),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      Botao(
                        onPress: () => Navigator.pushNamed(
                          context,
                          "/mystery",
                        ),
                        child: const TextoSublinhado("VER MISTÉRIO"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget showDica(List<Charada> charadas, double width) {
    if (charadas.isEmpty) {
      return const Center(
        child: Text("Sem dicas para apresentar"),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DicaView(
          charada: charadas[0],
          width: width,
        ),
        DicaView(
          charada: charadas[1],
          width: width,
        ),
      ],
    );
  }

  void showError(dynamic e) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e),
          ),
        );
      }
    });
  }

  void goToGameOver() => SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/game-over",
          (route) => route.settings.name == "/",
        );
      });
}
