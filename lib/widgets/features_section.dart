import 'package:flutter/cupertino.dart';
import '../data/app_data.dart';
import '../theme/app_theme.dart';

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
            child: Text('Más motivos para unirte', style: AppTheme.sectionTitle()),
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 230,
            child: CupertinoScrollbar(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                itemCount: AppData.features.length,
                itemBuilder: (context, index) =>
                    _FeatureCupertinoCard(feature: AppData.features[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureCupertinoCard extends StatelessWidget {
  final Map<String, dynamic> feature;
  const _FeatureCupertinoCard({required this.feature});

  @override
  Widget build(BuildContext context) {
    final colors = feature['gradient'] as List<Color>;
    final icon = feature['icon'] as IconData;

    return Container(
      width: 220,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      // Estilo iOS: bordes mas redondeados (12px) y sombra suave
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
        boxShadow: const [
          BoxShadow(color: Color(0x4D000000), blurRadius: 12, offset: Offset(0, 4)),
        ],
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titulo — Montserrat
          Text(feature['title'] as String,
              style: AppTheme.sectionTitle(fontSize: 16).copyWith(height: 1.3)),
          const SizedBox(height: 10),
          // Descripcion — Roboto
          Expanded(
            child: Text(feature['description'] as String,
                style: AppTheme.bodyText(fontSize: 13, color: const Color(0xDCFFFFFF))),
          ),
          // Icono CupertinoIcons (SF Symbols estilo Apple)
          Align(
            alignment: Alignment.bottomRight,
            child: Icon(icon, size: 42, color: const Color(0xFFCE93D8)),
          ),
        ],
      ),
    );
  }
}
