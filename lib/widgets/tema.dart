import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primary = Color.fromARGB(255, 8, 135, 175);
const bg = Color.fromARGB(200, 0, 0, 0);
const shadow = Color.fromARGB(255, 0, 0, 0);
const bodyShadow = Color.fromARGB(255, 35, 35, 35);

ThemeData temaAtual() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      surface: bg,
      onSurface: Colors.white,
    ),
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.julee(),
      headlineMedium: GoogleFonts.julee(),
      headlineSmall: GoogleFonts.julee(),
      titleLarge: GoogleFonts.julee(),
      titleMedium: GoogleFonts.julee(),
      titleSmall: GoogleFonts.julee(),
      bodyLarge: GoogleFonts.julee(),
      bodyMedium: GoogleFonts.julee(),
      bodySmall: GoogleFonts.julee(),
      displayLarge: GoogleFonts.julee(),
      displayMedium: GoogleFonts.julee(),
      displaySmall: GoogleFonts.julee(),
      labelLarge: GoogleFonts.julee(),
      labelMedium: GoogleFonts.julee(),
      labelSmall: GoogleFonts.julee(),
    ),
  );
}
