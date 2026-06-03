import 'package:flutter/material.dart';
import '../widgets/hero_section.dart';
import '../widgets/trending_section.dart';
import '../widgets/features_section.dart';
import '../widgets/faq_section.dart';
import '../widgets/footer_section.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.netflixBlack,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            // 1. Hero con navbar, imagen local + red, titulo y formulario
            HeroSection(),
            // 2. Seccion Tendencias — ListView horizontal con Cards y ranking
            TrendingSection(),
            // 3. Seccion "Mas motivos" — ListView horizontal de Cards
            FeaturesSection(),
            // 4. Seccion FAQ — ListView con ListTiles expandibles
            FaqSection(),
            // 5. CTA email repetido (footer superior)
            FooterEmailSection(),
            // 6. Footer con links y telefono
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
