import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final Widget child;
  final VoidCallback onPress;
  final EdgeInsets padding;

  const Botao({
    super.key,
    required this.child,
    required this.onPress,
    this.padding = const EdgeInsets.all(12),
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          padding: padding,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 6, 100, 131),
              ),
              BoxShadow(
                color: Color.fromARGB(255, 8, 135, 175),
                offset: Offset(-4, 4),
                blurRadius: 6,
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
