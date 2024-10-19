import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mysteria/entidade/partida_resumida.dart';
import 'package:mysteria/vm/jogador_vm.dart';
import 'package:mysteria/vm/partida_vm.dart';
import 'package:mysteria/widgets/botao.dart';
import 'package:mysteria/widgets/container_sombreado.dart';
import 'package:mysteria/widgets/texto_sublinhado.dart';
import 'package:provider/provider.dart';

class PartidaItem extends StatelessWidget {
  final PartidaResumida partida;

  const PartidaItem(this.partida, {super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textWidth = screenSize.width * 0.7;

    final tema = Theme.of(context);

    final jaldiStyle = GoogleFonts.jaldi(
      fontSize: 16,
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: ContainerSombreado(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: textWidth,
                    child: TextoSublinhado(
                      partida.titulo.toUpperCase(),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    width: 48,
                    height: 28,
                    child: Botao(
                      onPress: () => entraPartida(context),
                      padding: EdgeInsets.zero,
                      child: Icon(
                        partida.disponivel
                            ? Icons.play_arrow
                            : Icons.back_hand_outlined,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    partida.status.description,
                    style: jaldiStyle,
                  ),
                  Text(
                    "${partida.countJogadores} / ${partida.maxJogadores}",
                    style: jaldiStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> entraPartida(BuildContext context) async {
    if (!partida.disponivel) {
      return;
    }

    try {
      final jogadorVM = Provider.of<JogadorViewModel>(context, listen: false);

      await jogadorVM.adicionarNaPartida(partida);

      // ignore: use_build_context_synchronously
      await onSuccess(context);
    } catch (e) {
      if (context.mounted) {
        final messenger = ScaffoldMessenger.of(context);

        messenger.showSnackBar(
          SnackBar(
            content: Text(e.toString()),
          ),
        );
      }
    }
  }

  Future<void> onSuccess(BuildContext context) async {
    final partidaVM = Provider.of<PartidaViewModel>(context, listen: false);
    await partidaVM.setPartida(partida.id);

    if (context.mounted) {
      Navigator.pushNamed(context, "/loading");
    }
  }
}
