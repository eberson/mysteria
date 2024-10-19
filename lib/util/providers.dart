import 'package:flutter/material.dart';
import 'package:mysteria/vm/game_vm.dart';
import 'package:mysteria/vm/jogador_vm.dart';
import 'package:mysteria/vm/local_vm.dart';
import 'package:mysteria/vm/objeto_vm.dart';
import 'package:mysteria/vm/partida_vm.dart';
import 'package:mysteria/vm/personagem_vm.dart';
import 'package:mysteria/vm/pontos_interesse_vm.dart';
import 'package:provider/provider.dart';

class Providers {
  Providers._();

  static PersonagemViewModel personagemVM(BuildContext context) =>
      Provider.of<PersonagemViewModel>(context, listen: false);

  static LocalViewModel localVM(BuildContext context) =>
      Provider.of<LocalViewModel>(context, listen: false);

  static ObjetoViewModel objetoVM(BuildContext context) =>
      Provider.of<ObjetoViewModel>(context, listen: false);

  static GameViewModel gameVM(BuildContext context) =>
      Provider.of<GameViewModel>(context, listen: false);

  static JogadorViewModel jogadorVM(BuildContext context) =>
      Provider.of<JogadorViewModel>(context, listen: false);

  static PartidaViewModel partidaVM(BuildContext context) =>
      Provider.of<PartidaViewModel>(context, listen: false);

  static PontoInteresseViewModel pontoInteresseVM(BuildContext context) =>
      Provider.of<PontoInteresseViewModel>(context, listen: false);
}
