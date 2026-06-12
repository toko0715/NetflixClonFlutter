import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/detail_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: CupertinoColors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const NetflixApp());
}

class NetflixApp extends StatelessWidget {
  const NetflixApp({super.key});

  @override
  Widget build(BuildContext context) {
    // CupertinoApp — reemplaza MaterialApp
    return CupertinoApp(
      title: 'Netflix',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.cupertinoTheme,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return CupertinoPageRoute(
              builder: (_) => const HomeScreen(),
              settings: settings,
            );
          case '/detail':
            return CupertinoPageRoute(
              builder: (_) => const DetailScreen(),
              settings: settings,
            );
        }
        return null;
      },
      initialRoute: '/',
    );
  }
}
