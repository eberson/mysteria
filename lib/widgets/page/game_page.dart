import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mysteria/util/images.dart';
import 'package:mysteria/widgets/stack_container.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.julee(
      fontSize: 26,
      color: const Color.fromARGB(255, 216, 0, 0),
    );

    return Scaffold(
      body: StackContainer(
        child: Column(
          children: [
            Image.asset(Images.mysteriaName),
          ],
        ),
      ),
    );
  }
}
