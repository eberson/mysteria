import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const logo = "lib/assets/images/misteria_logo.png";

    final width = MediaQuery.of(context).size.width;
    final largura = width * 0.6;

    final nickController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              logo,
              width: largura,
              fit: BoxFit.fitWidth,
            ),
            Column(
              children: [
                Container(
                  width: largura,
                  margin: const EdgeInsets.only(bottom: 12),
                  child: TextField(
                    controller: nickController,
                    decoration: const InputDecoration(
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
          ],
        ),
      ),
    );
  }
}

class Aplicacao extends StatelessWidget {
  const Aplicacao({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "misterIA",
      home: HomePage(),
    );
  }
}

void main() => runApp(const Aplicacao());
