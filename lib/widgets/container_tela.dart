import 'package:flutter/material.dart';
import 'package:mysteria/util/shadow.dart';
import 'package:mysteria/widgets/tema.dart';

class ContainerTela extends StatelessWidget {
  final Widget child;

  const ContainerTela({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: innerShadow(
        shadow,
        const Color.fromARGB(255, 35, 35, 35),
        100,
        -30,
      ),
      child: child,
    );
  }
}
