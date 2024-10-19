import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mysteria/util/animations.dart';
import 'package:mysteria/util/images.dart';
import 'package:mysteria/widgets/stack_container.dart';

class GameOverPage extends StatelessWidget {
  const GameOverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StackContainer(
        child: Center(
          child: Column(children: [
            Image.asset(Images.faixaDestaque),
            const SizedBox(
              height: 30,
            ),
            Lottie.asset(Animations.gameOver),
          ]),
        ),
      ),
    );
  }
}
