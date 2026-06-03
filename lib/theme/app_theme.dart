import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color netflixRed = Color(0xFFE50914);
  static const Color netflixBlack = Color(0xFF000000);
  static const Color netflixDarkGray = Color(0xFF141414);
  static const Color netflixGray = Color(0xFF333333);
  static const Color netflixMediumGray = Color(0xFF2D2D2D);
  static const Color netflixLightGray = Color(0xFF757575);
  static const Color netflixWhite = Color(0xFFFFFFFF);
  static const Color cardBg = Color(0xFF1A1A3E);

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: netflixBlack,
      primaryColor: netflixRed,
      colorScheme: const ColorScheme.dark(
        primary: netflixRed,
        secondary: netflixRed,
        surface: netflixDarkGray,
      ),
      textTheme: TextTheme(
        // Fuente 1: Bebas Neue — titulos hero y numeros de ranking
        displayLarge: GoogleFonts.bebasNeue(
          fontSize: 64,
          color: netflixWhite,
          letterSpacing: 2,
        ),
        displayMedium: GoogleFonts.bebasNeue(
          fontSize: 52,
          color: netflixWhite,
          letterSpacing: 1.5,
        ),
        displaySmall: GoogleFonts.bebasNeue(
          fontSize: 38,
          color: netflixWhite,
          letterSpacing: 1,
        ),
        // Fuente 2: Montserrat — secciones, titulos de cards y botones
        headlineLarge: GoogleFonts.montserrat(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: netflixWhite,
        ),
        headlineMedium: GoogleFonts.montserrat(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: netflixWhite,
        ),
        headlineSmall: GoogleFonts.montserrat(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: netflixWhite,
        ),
        titleLarge: GoogleFonts.montserrat(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: netflixWhite,
        ),
        titleMedium: GoogleFonts.montserrat(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: netflixWhite,
        ),
        // Fuente 3: Roboto — cuerpo, descripciones y etiquetas
        bodyLarge: GoogleFonts.roboto(
          fontSize: 16,
          color: netflixWhite,
        ),
        bodyMedium: GoogleFonts.roboto(
          fontSize: 14,
          color: Color(0xFFE0E0E0),
        ),
        bodySmall: GoogleFonts.roboto(
          fontSize: 12,
          color: netflixLightGray,
        ),
        labelLarge: GoogleFonts.roboto(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: netflixWhite,
        ),
        labelMedium: GoogleFonts.roboto(
          fontSize: 12,
          color: netflixLightGray,
        ),
      ),
      cardTheme: const CardThemeData(
        color: cardBg,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        elevation: 4,
      ),
      dividerTheme: const DividerThemeData(
        color: netflixGray,
        thickness: 8,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: netflixWhite),
      ),
    );
  }
}
