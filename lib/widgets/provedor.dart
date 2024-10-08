import 'package:flutter/material.dart';
import 'package:mysteria/vm/jogador_vm.dart';
import 'package:mysteria/widgets/app.dart';
import 'package:provider/provider.dart';

class Provedor extends StatelessWidget {
  const Provedor({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        JogadorViewModel.create(),
      ],
      child: const Aplicacao(),
    );
  }
}
