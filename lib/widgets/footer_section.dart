import 'package:flutter/cupertino.dart';
import '../data/app_data.dart';
import '../theme/app_theme.dart';

class FooterEmailSection extends StatelessWidget {
  const FooterEmailSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.netflixBlack,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        children: [
          Text(
            '¿Quieres ver Netflix ya? Ingresa tu email para crear una cuenta o reiniciar tu membresía de Netflix.',
            textAlign: TextAlign.center,
            style: AppTheme.bodyText(fontSize: 15),
          ),
          const SizedBox(height: 16),
          // CupertinoTextField
          CupertinoTextField(
            placeholder: 'Email',
            placeholderStyle: AppTheme.bodyText(color: CupertinoColors.systemGrey),
            keyboardType: TextInputType.emailAddress,
            style: AppTheme.bodyText(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: AppTheme.netflixBlack,
              border: Border.all(color: CupertinoColors.systemGrey),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 10),
          // CupertinoButton
          SizedBox(
            width: double.infinity,
            child: CupertinoButton(
              color: AppTheme.netflixRed,
              borderRadius: BorderRadius.circular(4),
              padding: const EdgeInsets.symmetric(vertical: 14),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Comenzar', style: AppTheme.sectionTitle(fontSize: 18)),
                  const Icon(CupertinoIcons.chevron_right, color: CupertinoColors.white, size: 22),
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
          Container(height: 1, color: AppTheme.netflixMediumGray),
          const SizedBox(height: 16),
          Text('¿Preguntas? Llama al 0 800 55821',
              style: AppTheme.bodyText(fontSize: 13, color: AppTheme.netflixLightGray)),
          const SizedBox(height: 18),
          Wrap(
            children: AppData.footerLinks.map((link) {
              return SizedBox(
                width: (MediaQuery.of(context).size.width - 40) / 2,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    alignment: Alignment.centerLeft,
                    onPressed: () {},
                    child: Text(
                      link['text']!,
                      style: AppTheme.bodyText(fontSize: 12, color: AppTheme.netflixLightGray)
                          .copyWith(decoration: TextDecoration.underline,
                              decorationColor: AppTheme.netflixLightGray),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 14),
          // Selector idioma con CupertinoButton
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: CupertinoColors.systemGrey),
              borderRadius: BorderRadius.circular(4),
            ),
            child: CupertinoButton(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              minimumSize: Size.zero,
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(CupertinoIcons.globe, size: 15, color: CupertinoColors.white),
                  const SizedBox(width: 6),
                  Text('Español', style: AppTheme.bodyText(fontSize: 13)),
                  const SizedBox(width: 4),
                  const Icon(CupertinoIcons.chevron_down, size: 12, color: CupertinoColors.white),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Esta página está protegida por Google reCAPTCHA para comprobar que no eres un robot.',
            style: AppTheme.bodyText(fontSize: 11, color: AppTheme.netflixLightGray),
          ),
        ],
      ),
    );
  }
}
