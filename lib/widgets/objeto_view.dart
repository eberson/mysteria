import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mysteria/entidade/objeto.dart';
import 'package:mysteria/vm/game_vm.dart';
import 'package:mysteria/vm/objeto_vm.dart';
import 'package:provider/provider.dart';

class ObjetoView extends StatelessWidget {
  final Objeto objeto;

  const ObjetoView({super.key, required this.objeto});

  @override
  Widget build(BuildContext context) {
    final objetoVM = Provider.of<ObjetoViewModel>(context);

    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: objeto.foto,
            height: 430,
            fit: BoxFit.fitWidth,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => objetoVM.seleciona(objeto),
                icon: const Icon(
                  Icons.add_circle,
                  color: Colors.green,
                  size: 32,
                ),
              ),
              IconButton(
                onPressed: () => objetoVM.exclui(objeto),
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
