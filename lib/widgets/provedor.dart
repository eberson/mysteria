import 'package:flutter/material.dart';
import 'package:mysteria/vm/jogador_vm.dart';
import 'package:mysteria/vm/partida_list_vm.dart';
import 'package:mysteria/vm/partida_vm.dart';
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
      ],
      child: const Aplicacao(),
    );
  }
}
