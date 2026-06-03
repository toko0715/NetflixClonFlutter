import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/app_data.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Más motivos para unirte',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          const SizedBox(height: 14),
          // ListView horizontal de Cards de características
          SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              itemCount: AppData.features.length,
              itemBuilder: (context, index) {
                final feature = AppData.features[index];
                return _FeatureCard(feature: feature);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final Map<String, dynamic> feature;
  const _FeatureCard({required this.feature});

  @override
  Widget build(BuildContext context) {
    final colors = feature['gradient'] as List<Color>;
    final icon = feature['icon'] as IconData;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        width: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: colors,
          ),
        ),
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Titulo de la caracteristica — Fuente 2: Montserrat
            Text(
              feature['title'] as String,
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 10),
            // Descripcion — Fuente 3: Roboto
            Expanded(
              child: Text(
                feature['description'] as String,
                style: GoogleFonts.roboto(
                  fontSize: 13,
                  color: Colors.white.withAlpha(220),
                  height: 1.4,
                ),
              ),
            ),
            // Icono de la caracteristica
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                icon,
                size: 42,
                color: Colors.purple[200],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
