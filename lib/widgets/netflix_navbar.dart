import 'package:flutter/cupertino.dart';
import '../theme/app_theme.dart';

class NetflixNavbar extends StatelessWidget {
  const NetflixNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo NETFLIX — Bebas Neue
          Text('NETFLIX', style: AppTheme.heroTitle(fontSize: 34).copyWith(
            color: AppTheme.netflixRed,
            letterSpacing: 3,
          )),
          Row(
            children: [
              // CupertinoButton sin relleno — selector de idioma
              CupertinoButton(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                minimumSize: Size.zero,
                onPressed: () {},
                child: Row(
                  children: [
                    const Icon(CupertinoIcons.globe, size: 15, color: CupertinoColors.white),
                    const SizedBox(width: 4),
                    Text('Español', style: AppTheme.bodyText(fontSize: 13)),
                  ],
                ),
              ),
              // CupertinoButton con color — Iniciar sesion
              CupertinoButton(
                color: AppTheme.netflixRed,
                borderRadius: BorderRadius.circular(3),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                minimumSize: Size.zero,
                onPressed: () {},
                child: Text('Iniciar sesión',
                    style: AppTheme.bodyText(fontSize: 13)
                        .copyWith(fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
