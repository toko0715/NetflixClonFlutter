import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/detail_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Barra de estado transparente para el efecto hero de Netflix
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const NetflixApp());
}

class NetflixApp extends StatelessWidget {
  const NetflixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix',
      debugShowCheckedModeBanner: false,
      // Tema Global de la aplicacion
      theme: AppTheme.darkTheme,
      // Rutas de la aplicacion
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/detail': (context) => const DetailScreen(),
      },
    );
  }
}
