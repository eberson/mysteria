import 'package:flutter/material.dart';

BoxDecoration innerShadow(
    Color shadow, Color body, double blur, double spread) {
  return BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: shadow,
      ),
      BoxShadow(
        color: body,
        spreadRadius: spread,
        blurRadius: blur,
      ),
    ],
  );
}

BoxDecoration circularInnerShadow(Color shadow, Color body, double radius) {
  return BoxDecoration(
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(
        color: shadow,
      ),
      BoxShadow(
        color: body,
        spreadRadius: -1 * radius,
        blurRadius: radius,
      ),
    ],
  );
}
