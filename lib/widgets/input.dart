import 'package:flutter/material.dart';

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
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        right: 10,
        bottom: 25,
      ),
      width: width,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 137, 4, 4),
            blurRadius: 5,
            spreadRadius: 5,
          ),
          BoxShadow(
            color: Color.fromARGB(255, 183, 6, 6),
            offset: Offset(5, -5),
            blurRadius: 2,
            spreadRadius: 1,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
