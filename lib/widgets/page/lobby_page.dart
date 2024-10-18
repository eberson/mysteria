import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mysteria/entidade/status_partida.dart';
import 'package:mysteria/util/space.dart';
import 'package:mysteria/vm/partida_vm.dart';
import 'package:mysteria/widgets/botao.dart';
import 'package:mysteria/widgets/container_sombreado.dart';
import 'package:mysteria/widgets/headline.dart';
import 'package:mysteria/widgets/stack_container.dart';
import 'package:mysteria/widgets/texto_sublinhado.dart';
import 'package:provider/provider.dart';

class LobbyPage extends StatefulWidget {
  const LobbyPage({super.key});

  @override
  State<LobbyPage> createState() => _LobbyPageState();
}

class _LobbyPageState extends State<LobbyPage> {
  late Timer? _timer;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 2), (_) async {
      try {
        final vm = Provider.of<PartidaViewModel>(context, listen: false);
        await vm.refresh();

        if (vm.partida != null) {
          if (vm.partida!.status == StatusPartida.aguardando &&
              vm.partida!.salaCheia) {
            try {
              await vm.iniciaPartida();
              goToLoading();
            } catch (e) {
              showError(e);
            }
          } else if (vm.partida!.status == StatusPartida.andamento) {
            goToLoading();
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
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final containerHeight = screenHeight * 0.6;

    final partidaVM = Provider.of<PartidaViewModel>(context);

    final jogadores = partidaVM.jogadores;
    final partida = partidaVM.partida;

    return Scaffold(
      body: StackContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Headline("LOBBY"),
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
                bottom: 16,
                left: 25,
                right: 25,
              ),
              child: ContainerSombreado(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  height: containerHeight,
                  child: Column(
                    children: [
                      Text(
                        "Jogadores: ${partida?.countJogadores ?? 0} / ${partida?.maxJogadores ?? 0}",
                        style: GoogleFonts.jaldi(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: jogadores.length,
                          itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.only(bottom: 18),
                            child: TextoSublinhado(
                              "JOGADOR(A): ${jogadores[index].nome.toUpperCase()}",
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Aguardando Jogadores...",
                        style: GoogleFonts.jaldi(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: Space.stayBottom,
              child: Column(
                children: [
                  Botao(
                    onPress: () => Navigator.pop(context),
                    child: const TextoSublinhado("Voltar"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showError(dynamic e) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e),
        ),
      );
    });
  }

  void goToLoading() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        "/loading",
        (route) => route.settings.name == "/",
      );
    });
  }
}
