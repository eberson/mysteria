import 'package:flutter/material.dart';
import 'package:mysteria/util/providers.dart';

void resetPartida(BuildContext context) {
  Providers.gameVM(context).reset();
  Providers.jogadorVM(context).reset();
  Providers.localVM(context).reset();
  Providers.objetoVM(context).reset();
  Providers.partidaVM(context).reset();
  Providers.personagemVM(context).reset();
  Providers.pontoInteresseVM(context).reset();
}
