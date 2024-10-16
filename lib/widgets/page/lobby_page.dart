import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mysteria/util/space.dart';
import 'package:mysteria/vm/partida_vm.dart';
import 'package:mysteria/widgets/botao.dart';
import 'package:mysteria/widgets/container_sombreado.dart';
import 'package:mysteria/widgets/headline.dart';
import 'package:mysteria/widgets/stack_container.dart';
import 'package:mysteria/widgets/texto_sublinhado.dart';
import 'package:provider/provider.dart';

class LobbyPage extends StatelessWidget {
  const LobbyPage({super.key});

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
                top: 30,
                bottom: 30,
                left: 25,
                right: 25,
              ),
              child: ContainerSombreado(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  height: containerHeight,
                  child: Column(
                    children: [
                      Text(
                        "Jogadores: ${partida.countJogadores} / ${partida.maxJogadores}",
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
                            margin: const EdgeInsets.only(bottom: 25),
                            child: TextoSublinhado(
                              "JOGADOR(A): ${jogadores[index].nome.toUpperCase()}",
                            ),
                          ),
                        ),
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
                    onPress: () => Navigator.pushNamedAndRemoveUntil(
                      context,
                      "/loading",
                      (route) => route.settings.name == "/",
                    ),
                    child: const TextoSublinhado("Loading"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
}
