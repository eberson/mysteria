import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mysteria/entidade/local.dart';
import 'package:mysteria/vm/local_vm.dart';
import 'package:provider/provider.dart';

class LocalView extends StatelessWidget {
  final Local local;

  const LocalView({super.key, required this.local});

  @override
  Widget build(BuildContext context) {
    final localVM = Provider.of<LocalViewModel>(context);

    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: local.foto,
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
                onPressed: () => localVM.seleciona(local),
                icon: const Icon(
                  Icons.add_circle,
                  color: Colors.green,
                  size: 32,
                ),
              ),
              IconButton(
                onPressed: () => localVM.exclui(local),
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
