import 'package:flutter/material.dart';
import 'package:mysteria/util/cores.dart';
import 'package:mysteria/util/images.dart';
import 'package:mysteria/util/shadow.dart';

class StackContainer extends StatelessWidget {
  final Widget child;

  const StackContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
        ),
        Positioned.fill(
          child: Image.asset(
            Images.faixaDestaque,
            repeat: ImageRepeat.repeat,
          ),
        ),
        Container(
          decoration: innerShadow(
            Cores.shadowPreto.withAlpha(240),
            Cores.overShadowPreto.withAlpha(150),
            100,
            -30,
          ),
        ),
        child,
      ],
    );
  }
}
