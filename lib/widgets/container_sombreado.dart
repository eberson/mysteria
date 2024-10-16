import 'package:flutter/material.dart';
import 'package:mysteria/util/cores.dart';

class ContainerSombreado extends StatelessWidget {
  final Widget child;
  final double width;

  const ContainerSombreado({
    super.key,
    required this.child,
    this.width = double.maxFinite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        right: 5,
      ),
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Cores.shadowVermelho,
          ),
          BoxShadow(
            color: Cores.overShadowVermelho,
            offset: const Offset(-4, 4),
            blurRadius: 6,
          ),
        ],
      ),
      child: child,
    );
  }
}
