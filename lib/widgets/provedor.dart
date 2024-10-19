import 'package:flutter/material.dart';
import 'package:mysteria/vm/game_vm.dart';
import 'package:mysteria/vm/jogador_vm.dart';
import 'package:mysteria/vm/local_vm.dart';
import 'package:mysteria/vm/objeto_vm.dart';
import 'package:mysteria/vm/partida_list_vm.dart';
import 'package:mysteria/vm/partida_vm.dart';
import 'package:mysteria/vm/personagem_vm.dart';
import 'package:mysteria/vm/pontos_interesse_vm.dart';
import 'package:mysteria/widgets/app.dart';
import 'package:provider/provider.dart';

class Provedor extends StatelessWidget {
  const Provedor({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        JogadorViewModel.create(),
        PartidaListViewModel.create(),
        PartidaViewModel.create(),
        PontoInteresseViewModel.create(),
        GameViewModel.create(),
        PersonagemViewModel.create(),
        ObjetoViewModel.create(),
        LocalViewModel.create(),
      ],
      child: const Aplicacao(),
    );
  }
}
