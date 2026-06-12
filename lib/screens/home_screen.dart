import 'package:flutter/cupertino.dart';
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
    // CupertinoPageScaffold — reemplaza Scaffold
    return CupertinoPageScaffold(
      backgroundColor: AppTheme.netflixBlack,
      child: CupertinoScrollbar(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HeroSection(),
              TrendingSection(),
              FeaturesSection(),
              FaqSection(),
              FooterEmailSection(),
              FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
