import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import 'netflix_navbar.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.88;

    return SizedBox(
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Capa 1: Imagen LOCAL como fondo base (imagen generada en assets)
          Image.asset(
            'assets/images/hero_local.png',
            fit: BoxFit.cover,
          ),
          // Capa 2: Imagen de la NUBE (collage de películas) con opacidad
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withAlpha(100),
              BlendMode.darken,
            ),
            child: Image.network(
              'https://picsum.photos/seed/netflixhero2024/1200/800',
              fit: BoxFit.cover,
              errorBuilder: (context, error, _) => const SizedBox.shrink(),
            ),
          ),
          // Capa 3: Gradiente oscuro para legibilidad del texto
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x4D000000),
                  Color(0x80000000),
                  Color(0xCC000000),
                  Color(0xFF000000),
                ],
                stops: [0.0, 0.35, 0.7, 1.0],
              ),
            ),
          ),
          // Capa 4: Contenido
          Column(
            children: [
              const NetflixNavbar(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Titulo principal — Fuente 1: Bebas Neue
                      Text(
                        'Películas y series\nilimitadas y mucho más',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.bebasNeue(
                          fontSize: 52,
                          color: Colors.white,
                          letterSpacing: 1,
                          height: 1.05,
                        ),
                      ),
                      const SizedBox(height: 14),
                      // Subtitulo precio — Fuente 2: Montserrat
                      Text(
                        'A partir de S/ 28.90. Cancela cuando quieras.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 18),
                      // CTA texto — Fuente 3: Roboto
                      Text(
                        '¿Quieres ver Netflix ya? Ingresa tu email para crear\nuna cuenta o reiniciar tu membresía de Netflix.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          color: Colors.white,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 22),
                      // Campo de email
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: GoogleFonts.roboto(
                            color: Colors.grey[500],
                            fontSize: 15,
                          ),
                          filled: true,
                          fillColor: Colors.black.withAlpha(180),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1.5),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1.5),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.white, width: 1.5),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        style: GoogleFonts.roboto(color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      // Boton Comenzar — ancho completo
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.netflixRed,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            elevation: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Comenzar',
                                style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                                size: 26,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Linea signature de Netflix (rosa/roja abajo del hero)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 4,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Color(0xFFE50914),
                    Color(0xFFFF4D8B),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
