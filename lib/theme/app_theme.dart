import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color netflixRed = Color(0xFFE50914);
  static const Color netflixBlack = Color(0xFF000000);
  static const Color netflixDarkGray = Color(0xFF141414);
  static const Color netflixGray = Color(0xFF333333);
  static const Color netflixMediumGray = Color(0xFF2D2D2D);
  static const Color netflixLightGray = Color(0xFF757575);
  static const Color netflixWhite = CupertinoColors.white;
  static const Color cardBg = Color(0xFF1A1A3E);

  // CupertinoThemeData — reemplaza ThemeData
  static const CupertinoThemeData cupertinoTheme = CupertinoThemeData(
    brightness: Brightness.dark,
    primaryColor: netflixRed,
    scaffoldBackgroundColor: netflixBlack,
    barBackgroundColor: netflixBlack,
    textTheme: CupertinoTextThemeData(
      primaryColor: CupertinoColors.white,
      textStyle: TextStyle(color: CupertinoColors.white, fontSize: 16),
    ),
  );

  // Fuente 1: Bebas Neue — titulos hero y rankings
  static TextStyle heroTitle({double fontSize = 52}) =>
      GoogleFonts.bebasNeue(fontSize: fontSize, color: netflixWhite, letterSpacing: 1);

  // Fuente 2: Montserrat — secciones, cards y botones
  static TextStyle sectionTitle({double fontSize = 24}) =>
      GoogleFonts.montserrat(fontSize: fontSize, fontWeight: FontWeight.bold, color: netflixWhite);

  // Fuente 3: Roboto — cuerpo y descripciones
  static TextStyle bodyText({double fontSize = 14, Color? color}) =>
      GoogleFonts.roboto(fontSize: fontSize, color: color ?? netflixWhite, height: 1.5);
}
