import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mysteria/entidade/partida.dart';
import 'package:mysteria/vm/partida_vm.dart';
import 'package:mysteria/widgets/botao.dart';
import 'package:mysteria/widgets/container_sombreado.dart';
import 'package:mysteria/widgets/texto_sublinhado.dart';
import 'package:provider/provider.dart';

class PartidaItem extends StatelessWidget {
  final Partida partida;

  const PartidaItem(this.partida, {super.key});

  @override
  Widget build(BuildContext context) {
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
                  TextoSublinhado(partida.name.toUpperCase()),
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

  void entraPartida(BuildContext context) {
    if (!partida.disponivel) {
      return;
    }

    final vm = Provider.of<PartidaViewModel>(context, listen: false);
    vm.setPartida(partida);

    Navigator.pushNamed(context, "/lobby");
  }
}
