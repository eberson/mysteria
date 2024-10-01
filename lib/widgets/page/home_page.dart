import 'package:flutter/material.dart';
import 'package:misteria/util/shadow.dart';
import 'package:misteria/widgets/container_tela.dart';
import 'package:misteria/widgets/tema.dart';

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
              margin: const EdgeInsets.only(bottom: 12),
              child: TextField(
                controller: nickController,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: "Nick",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Entrar"),
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
