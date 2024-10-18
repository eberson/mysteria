import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mysteria/entidade/partida.dart';
import 'package:mysteria/entidade/partida_resumida.dart';
import 'package:mysteria/util/space.dart';
import 'package:mysteria/vm/jogador_vm.dart';
import 'package:mysteria/vm/partida_list_vm.dart';
import 'package:mysteria/widgets/botao.dart';
import 'package:mysteria/widgets/container_sombreado.dart';
import 'package:mysteria/widgets/headline.dart';
import 'package:mysteria/widgets/partida_item.dart';
import 'package:mysteria/widgets/stack_container.dart';
import 'package:mysteria/widgets/texto_sublinhado.dart';
import 'package:provider/provider.dart';

class PartidasPage extends StatefulWidget {
  const PartidasPage({super.key});

  @override
  State<PartidasPage> createState() => _PartidasPageState();
}

class _PartidasPageState extends State<PartidasPage> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final vm = Provider.of<PartidaListViewModel>(context, listen: false);
      vm.refresh();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final partidasListVM = Provider.of<PartidaListViewModel>(context);
    final jogadorVM = Provider.of<JogadorViewModel>(context);

    final partidas = partidasListVM.partidas;

    return Scaffold(
      body: StackContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Headline("PARTIDAS"),
            const SizedBox(
              height: 12,
            ),
            TextoSublinhado(jogadorVM.jogador?.nome ?? "Desconhecido"),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: partidas.isNotEmpty ? listaPartidas(partidas) : empty(),
            ),
            Padding(
              padding: Space.stayBottom,
              child: Botao(
                onPress: partidasListVM.refresh,
                child: const TextoSublinhado("ATUALIZAR"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listaPartidas(List<PartidaResumida> partidas) => ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: partidas.length,
        itemBuilder: (context, index) => PartidaItem(partidas[index]),
      );

  Widget empty() => const Center(
        child: SizedBox(
          width: 250,
          height: 210,
          child: ContainerSombreado(
            child: Center(
              child: TextoSublinhado(
                "NÃO EXISTEM PARTIDAS ABERTAS!",
              ),
            ),
          ),
        ),
      );
}
