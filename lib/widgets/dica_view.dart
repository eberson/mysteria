import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:mysteria/entidade/charada.dart';
import 'package:mysteria/geo/location.dart';
import 'package:mysteria/util/cores.dart';
import 'package:mysteria/util/providers.dart';
import 'package:mysteria/util/shadow.dart';
import 'package:mysteria/widgets/botao.dart';
import 'package:mysteria/widgets/texto_sublinhado.dart';

class DicaView extends StatefulWidget {
  final Charada charada;
  final double width;

  const DicaView({
    super.key,
    required this.charada,
    required this.width,
  });

  @override
  State<DicaView> createState() => _DicaViewState();
}

class _DicaViewState extends State<DicaView> {
  bool coletada = false;
  bool podeColetar = false;
  double distancia = -1;
  LatLng? userPosition;

  late Timer? _timer;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 2), (_) async {
      if (coletada) {
        _timer?.cancel();
        log("timer da charada: ${widget.charada.coord} pausado");
        return;
      }

      setState(() {
        final pontoInteresseVM = Providers.pontoInteresseVM(context);

        distancia = getDistanceFromLatLonInMeters(
          pontoInteresseVM.jogador!,
          widget.charada.coord,
        );

      if (distancia <= 5) {
          podeColetar = true;
        }
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const verticalSpace = SizedBox(
      height: 8,
    );

    final body = <Widget>[
      const TextoSublinhado("DICA"),
      verticalSpace,
      Expanded(
        child: Container(
          padding: const EdgeInsets.all(8),
          width: double.maxFinite,
          child: Text(
            coletada ? widget.charada.conteudo : "Dica ainda não coletada",
            textAlign: TextAlign.left,
          ),
        ),
      ),
    ];

    if (!coletada) {
      body.addAll(
        [
          Text(
            "Distância: ${distancia == -1 ? "DESCONHECIDA" : "${distancia.toStringAsFixed(2)} metro(s)"}",
          ),
          verticalSpace,
        ],
      );
    }

    if (podeColetar && !coletada) {
      body.add(
        Container(
          alignment: Alignment.center,
          width: widget.width - 20,
          margin: const EdgeInsets.only(bottom: 20),
          child: Botao(
            child: const Text("Coletar"),
            onPress: () {
              Providers.gameVM(context).addCharadaColetada(widget.charada);

              setState(() {
                coletada = true;
              });
            },
          ),
        ),
      );
    }

    return Container(
      height: 300,
      width: widget.width,
      decoration: innerShadow(
        Cores.shadowPreto,
        Cores.overShadowPreto,
        100,
        -30,
      ),
      child: Column(
        children: body,
      ),
    );
  }
}
