import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primary = Color.fromARGB(255, 8, 135, 175);
const bg = Color.fromARGB(200, 0, 0, 0);
const shadow = Color.fromARGB(255, 0, 0, 0);
const bodyShadow = Color.fromARGB(255, 35, 35, 35);

const baseFontSize = 20.0;

ThemeData temaAtual() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      surface: bg,
      onSurface: Colors.white,
    ),
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.julee().copyWith(
        fontSize: baseFontSize,
      ),
      headlineMedium: GoogleFonts.julee().copyWith(
        fontSize: baseFontSize,
      ),
      headlineSmall: GoogleFonts.julee().copyWith(
        fontSize: baseFontSize,
      ),
      titleLarge: GoogleFonts.julee().copyWith(
        fontSize: baseFontSize,
      ),
      titleMedium: GoogleFonts.julee().copyWith(
        fontSize: baseFontSize,
      ),
      titleSmall: GoogleFonts.julee().copyWith(
        fontSize: baseFontSize,
      ),
      bodyLarge: GoogleFonts.julee().copyWith(
        fontSize: baseFontSize,
      ),
      bodyMedium: GoogleFonts.julee().copyWith(
        fontSize: baseFontSize,
      ),
      bodySmall: GoogleFonts.julee().copyWith(
        fontSize: baseFontSize,
      ),
      displayLarge: GoogleFonts.julee().copyWith(
        fontSize: baseFontSize,
      ),
      displayMedium: GoogleFonts.julee().copyWith(
        fontSize: baseFontSize,
      ),
      displaySmall: GoogleFonts.julee().copyWith(
        fontSize: baseFontSize,
      ),
      labelLarge: GoogleFonts.julee().copyWith(
        fontSize: baseFontSize,
      ),
      labelMedium: GoogleFonts.julee().copyWith(
        fontSize: baseFontSize,
      ),
      labelSmall: GoogleFonts.julee().copyWith(
        fontSize: baseFontSize,
      ),
    ),
  );
}
