import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mysteria/entidade/personagem.dart';
import 'package:mysteria/util/cores.dart';
import 'package:mysteria/vm/personagem_vm.dart';
import 'package:provider/provider.dart';

class PersonagemView extends StatelessWidget {
  final Personagem personagem;

  const PersonagemView({super.key, required this.personagem});

  @override
  Widget build(BuildContext context) {
    final personagemVM = Provider.of<PersonagemViewModel>(context);

    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: personagem.foto,
            height: 430,
            fit: BoxFit.fitWidth,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => Center(
              child: Icon(
                Icons.error,
                color: Cores.overShadowVermelho,
                size: 64,
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => personagemVM.seleciona(personagem),
                icon: const Icon(
                  Icons.add_circle,
                  color: Colors.green,
                  size: 32,
                ),
              ),
              IconButton(
                onPressed: () => personagemVM.exclui(personagem),
                icon: const Icon(
                  Icons.highlight_off,
                  color: Colors.red,
                  size: 32,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
