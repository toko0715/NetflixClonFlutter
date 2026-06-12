import 'package:flutter/cupertino.dart';
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
          // Imagen LOCAL como fondo base
          Image.asset('assets/images/hero_local.png', fit: BoxFit.cover),
          // Imagen de la NUBE con oscurecimiento
          ColorFiltered(
            colorFilter: const ColorFilter.mode(Color(0x66000000), BlendMode.darken),
            child: Image.network(
              'https://picsum.photos/seed/netflixhero2024/1200/800',
              fit: BoxFit.cover,
              errorBuilder: (context, error, _) => const SizedBox.shrink(),
            ),
          ),
          // Gradiente oscuro
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0x4D000000), Color(0x80000000), Color(0xCC000000), Color(0xFF000000)],
                stops: [0.0, 0.35, 0.7, 1.0],
              ),
            ),
          ),
          // Contenido
          SafeArea(
            child: Column(
              children: [
                const NetflixNavbar(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Titulo — Bebas Neue
                        Text(
                          'Películas y series\nilimitadas y mucho más',
                          textAlign: TextAlign.center,
                          style: AppTheme.heroTitle(fontSize: 50).copyWith(height: 1.05),
                        ),
                        const SizedBox(height: 14),
                        // Subtitulo — Montserrat
                        Text(
                          'A partir de S/ 28.90. Cancela cuando quieras.',
                          textAlign: TextAlign.center,
                          style: AppTheme.sectionTitle(fontSize: 19),
                        ),
                        const SizedBox(height: 18),
                        // CTA — Roboto
                        Text(
                          '¿Quieres ver Netflix ya? Ingresa tu email para crear\nuna cuenta o reiniciar tu membresía de Netflix.',
                          textAlign: TextAlign.center,
                          style: AppTheme.bodyText(fontSize: 14),
                        ),
                        const SizedBox(height: 22),
                        // CupertinoTextField — reemplaza TextField
                        CupertinoTextField(
                          placeholder: 'Email',
                          placeholderStyle: GoogleFonts.roboto(color: CupertinoColors.systemGrey),
                          keyboardType: TextInputType.emailAddress,
                          style: AppTheme.bodyText(),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                          decoration: BoxDecoration(
                            color: const Color(0xB3000000),
                            border: Border.all(color: CupertinoColors.systemGrey, width: 1.5),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        const SizedBox(height: 12),
                        // CupertinoButton — reemplaza ElevatedButton
                        SizedBox(
                          width: double.infinity,
                          child: CupertinoButton(
                            color: AppTheme.netflixRed,
                            borderRadius: BorderRadius.circular(5),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Comenzar', style: AppTheme.sectionTitle(fontSize: 19)),
                                const SizedBox(width: 4),
                                const Icon(CupertinoIcons.chevron_right, color: CupertinoColors.white, size: 20),
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
          ),
          // Linea signature Netflix
          Positioned(
            bottom: 0, left: 0, right: 0,
            child: Container(
              height: 4,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0x00000000), Color(0xFFE50914), Color(0xFFFF4D8B), Color(0x00000000)],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
