import 'package:flutter/material.dart';
import 'package:misteria/util/shadow.dart';
import 'package:misteria/widgets/botao.dart';
import 'package:misteria/widgets/container_tela.dart';
import 'package:misteria/widgets/input.dart';
import 'package:misteria/widgets/tema.dart';
import 'package:misteria/widgets/texto_sublinhado.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

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
                      Row(
                        children: [
                          const TextoSublinhado(
                            content: "NICK NAME",
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Image.asset(
                            "lib/assets/images/usuario.png",
                            width: 24,
                            height: 24,
                          ),
                        ],
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
                onPress: () {},
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
}
