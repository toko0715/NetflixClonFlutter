import 'package:flutter/cupertino.dart';
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
            child: Text('Tendencias', style: AppTheme.sectionTitle()),
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 215,
            // CupertinoScrollbar — scrollbar estilo iOS
            child: CupertinoScrollbar(
              thumbVisibility: true,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: AppData.trendingMovies.length,
                itemBuilder: (context, index) {
                  final movie = AppData.trendingMovies[index];
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/detail', arguments: movie),
                    child: _MovieRankCard(movie: movie),
                  );
                },
              ),
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
    final isLocal = movie['isLocal'] as bool;

    return SizedBox(
      width: 160,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomLeft,
        children: [
          Positioned(
            right: 0, top: 0, bottom: 0, left: 30,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: isLocal
                  ? Image.asset('assets/images/poster_local.png', fit: BoxFit.cover)
                  : Image.network(
                      movie['imageUrl'] as String,
                      fit: BoxFit.cover,
                      // CupertinoActivityIndicator — spinner estilo iOS
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return Container(
                          color: AppTheme.netflixMediumGray,
                          child: const Center(
                            child: CupertinoActivityIndicator(
                              color: CupertinoColors.white,
                              radius: 14,
                            ),
                          ),
                        );
                      },
                      errorBuilder: (context, error, _) => Container(
                        color: AppTheme.netflixMediumGray,
                        child: const Icon(CupertinoIcons.film, color: CupertinoColors.systemGrey, size: 36),
                      ),
                    ),
            ),
          ),
          // Numero ranking — Bebas Neue
          Positioned(
            bottom: 0, left: 0,
            child: SizedBox(
              width: 70, height: 110,
              child: Stack(
                children: [
                  Text('${movie['rank']}', style: GoogleFonts.bebasNeue(
                    fontSize: 110,
                    foreground: Paint()..style = PaintingStyle.stroke..strokeWidth = 4..color = const Color(0xFF555555),
                  )),
                  Text('${movie['rank']}', style: GoogleFonts.bebasNeue(fontSize: 110, color: AppTheme.netflixBlack)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
