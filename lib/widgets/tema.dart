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
      headlineLarge: GoogleFonts.julee().copyWith(
        fontSize: 57,
      ),
      headlineMedium: GoogleFonts.julee().copyWith(
        fontSize: 50,
      ),
      headlineSmall: GoogleFonts.julee().copyWith(
        fontSize: 43,
      ),
      titleLarge: GoogleFonts.julee().copyWith(
        fontSize: 39,
      ),
      titleMedium: GoogleFonts.julee().copyWith(
        fontSize: 28,
      ),
      titleSmall: GoogleFonts.julee().copyWith(
        fontSize: 25,
      ),
      bodyLarge: GoogleFonts.julee().copyWith(
        fontSize: 28,
      ),
      bodyMedium: GoogleFonts.julee().copyWith(
        fontSize: 25,
      ),
      bodySmall: GoogleFonts.julee().copyWith(
        fontSize: 21,
      ),
      displayLarge: GoogleFonts.julee().copyWith(
        fontSize: 102,
      ),
      displayMedium: GoogleFonts.julee().copyWith(
        fontSize: 80,
      ),
      displaySmall: GoogleFonts.julee().copyWith(
        fontSize: 64,
      ),
      labelLarge: GoogleFonts.julee().copyWith(
        fontSize: 28,
      ),
      labelMedium: GoogleFonts.julee().copyWith(
        fontSize: 28,
      ),
      labelSmall: GoogleFonts.julee().copyWith(
        fontSize: 28,
      ),
    ),
  );
}
