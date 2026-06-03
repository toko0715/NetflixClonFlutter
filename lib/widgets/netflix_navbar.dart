import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class NetflixNavbar extends StatelessWidget {
  const NetflixNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo NETFLIX — Fuente: Bebas Neue (local concept via Text widget)
          Text(
            'NETFLIX',
            style: GoogleFonts.bebasNeue(
              fontSize: 36,
              color: AppTheme.netflixRed,
              letterSpacing: 3,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              // Selector de idioma
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.language, size: 15, color: Colors.white),
                label: Text(
                  'Español',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white, width: 1),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // Boton Iniciar sesion
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.netflixRed,
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Iniciar sesión',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
