import 'package:flutter/material.dart';
import 'package:mysteria/util/cores.dart';

class Input extends StatelessWidget {
  final TextEditingController? controller;
  final double width;

  const Input({
    super.key,
    this.controller,
    this.width = 400,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 40,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          fillColor: Cores.overShadowVermelho,
          filled: true,
        ),
      ),
    );
  }
}
