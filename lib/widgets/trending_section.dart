import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/app_data.dart';
import '../theme/app_theme.dart';

class TrendingSection extends StatelessWidget {
  const TrendingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            // Titulo seccion — Fuente 2: Montserrat
            child: Text(
              'Tendencias',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          const SizedBox(height: 14),
          // ListView horizontal de películas con ranking
          SizedBox(
            height: 215,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: AppData.trendingMovies.length,
              itemBuilder: (context, index) {
                final movie = AppData.trendingMovies[index];
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/detail',
                    arguments: movie,
                  ),
                  child: _MovieRankCard(movie: movie),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MovieRankCard extends StatelessWidget {
  final Map<String, dynamic> movie;
  const _MovieRankCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    final rank = movie['rank'] as int;
    final isLocal = movie['isLocal'] as bool;

    return SizedBox(
      width: 160,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomLeft,
        children: [
          // Poster de la película
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            left: 30,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: isLocal
                  // Imagen LOCAL (primera tarjeta usa asset local como demo)
                  ? Image.asset(
                      'assets/images/poster_local.png',
                      fit: BoxFit.cover,
                    )
                  // Imagen de la NUBE
                  : Image.network(
                      movie['imageUrl'] as String,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, _) => Container(
                        color: AppTheme.netflixGray,
                        child: const Icon(
                          Icons.movie,
                          color: Colors.white30,
                          size: 40,
                        ),
                      ),
                    ),
            ),
          ),
          // Numero de ranking grande — Fuente 1: Bebas Neue (efecto outline)
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              width: 70,
              height: 110,
              child: Stack(
                children: [
                  // Sombra/stroke del numero
                  Text(
                    '$rank',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 110,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 4
                        ..color = Colors.grey[700]!,
                    ),
                  ),
                  // Relleno del numero (negro)
                  Text(
                    '$rank',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 110,
                      color: AppTheme.netflixBlack,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
