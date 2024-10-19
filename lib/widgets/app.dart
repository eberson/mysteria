import 'package:flutter/material.dart';
import 'package:mysteria/widgets/page/dicas_page.dart';
import 'package:mysteria/widgets/page/game_page.dart';
import 'package:mysteria/widgets/page/home_page.dart';
import 'package:mysteria/widgets/page/loading_page.dart';
import 'package:mysteria/widgets/page/lobby_page.dart';
import 'package:mysteria/widgets/page/mystery_page.dart';
import 'package:mysteria/widgets/page/partidas_page.dart';
import 'package:mysteria/widgets/tema.dart';

class Aplicacao extends StatelessWidget {
  const Aplicacao({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "mysterIA",
      theme: temaAtual(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (_) => const HomePage(),
        "/partidas": (_) => const PartidasPage(),
        "/lobby": (_) => const LobbyPage(),
        "/loading": (_) => const LoadingPage(),
        "/game": (_) => const GamePage(),
        "/mystery": (_) => const MysteryPage(),
        "/dicas": (_) => const DicasPage(),
      },
    );
  }
}
