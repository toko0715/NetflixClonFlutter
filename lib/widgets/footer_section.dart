import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/app_data.dart';
import '../theme/app_theme.dart';

class FooterEmailSection extends StatelessWidget {
  const FooterEmailSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.netflixBlack,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
      child: Column(
        children: [
          Text(
            '¿Quieres ver Netflix ya? Ingresa tu email para crear una cuenta o reiniciar tu membresía de Netflix.',
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              fontSize: 16,
              color: Colors.white,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 18),
          TextField(
            decoration: InputDecoration(
              hintText: 'Email',
              hintStyle: GoogleFonts.roboto(color: Colors.grey[500]),
              filled: true,
              fillColor: Colors.black,
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(3),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
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
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.netflixRed,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Comenzar',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: Colors.white, size: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.netflixBlack,
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(color: AppTheme.netflixGray, thickness: 1),
          const SizedBox(height: 16),
          // Telefono
          Text(
            '¿Preguntas? Llama al 0 800 55821',
            style: GoogleFonts.roboto(
              fontSize: 14,
              color: AppTheme.netflixLightGray,
            ),
          ),
          const SizedBox(height: 20),
          // Grid de links usando Wrap
          Wrap(
            spacing: 0,
            runSpacing: 0,
            children: AppData.footerLinks.map((link) {
              return SizedBox(
                width: (MediaQuery.of(context).size.width - 40) / 2,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      link['text']!,
                      style: GoogleFonts.roboto(
                        fontSize: 13,
                        color: AppTheme.netflixLightGray,
                        decoration: TextDecoration.underline,
                        decorationColor: AppTheme.netflixLightGray,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          // Selector de idioma footer
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.language, size: 15, color: Colors.white),
            label: Text(
              'Español',
              style: GoogleFonts.roboto(color: Colors.white, fontSize: 13),
            ),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.grey, width: 1),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Esta página está protegida por Google reCAPTCHA para comprobar que no eres un robot.',
            style: GoogleFonts.roboto(
              fontSize: 11,
              color: AppTheme.netflixLightGray,
            ),
          ),
        ],
      ),
    );
  }
}
