import 'package:flutter/material.dart';
import 'package:mysteria/util/shadow.dart';
import 'package:mysteria/vm/jogador_vm.dart';
import 'package:mysteria/widgets/botao.dart';
import 'package:mysteria/widgets/container_tela.dart';
import 'package:mysteria/widgets/input.dart';
import 'package:mysteria/widgets/label.dart';
import 'package:mysteria/widgets/tema.dart';
import 'package:mysteria/widgets/texto_sublinhado.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const logo = "lib/assets/images/mysteria.png";
    const faixa = "lib/assets/images/faixa_destaque.png";

    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final largura = width * 0.6;
    final logoSpace = height * 0.08;
    final mainSpace = height * 0.15;

    final nickController = TextEditingController();

    return Scaffold(
      body: ContainerTela(
        child: Column(
          children: [
            Image.asset(faixa),
            SizedBox(
              height: logoSpace,
            ),
            _logo(logo, largura),
            SizedBox(
              height: mainSpace,
            ),
            Container(
              width: largura,
              margin: const EdgeInsets.only(bottom: 30),
              child: Column(
                children: [
                  Column(
                    children: [
                      const Label(
                        "NICK NAME",
                        imageAsset: "lib/assets/images/usuario.png",
                      ),
                      const SizedBox(height: 10),
                      Input(
                        controller: nickController,
                        width: double.maxFinite,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: largura * 0.6,
              child: Botao(
                onPress: () {
                  _entrar(context, nickController.text);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextoSublinhado(
                      content: "ENTRAR",
                    ),
                    Icon(
                      Icons.play_arrow,
                      color: Color.fromARGB(255, 183, 6, 6),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _logo(String logo, double largura) => Container(
        width: largura,
        height: largura,
        decoration: circularInnerShadow(
          bodyShadow,
          const Color.fromARGB(255, 88, 87, 87),
          20,
        ),
        child: Image.asset(
          logo,
          width: largura,
          fit: BoxFit.fitWidth,
        ),
      );

  void _entrar(BuildContext context, String? nome) {
    final jogadorVM = Provider.of<JogadorViewModel>(
      context,
      listen: false,
    );

    jogadorVM.createJogador(nome);

    Navigator.pushNamed(context, "/partidas");
  }
}
