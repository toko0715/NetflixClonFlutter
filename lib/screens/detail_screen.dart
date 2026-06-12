import 'package:flutter/cupertino.dart';
import '../data/app_data.dart';
import '../theme/app_theme.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final related = AppData.trendingMovies
        .where((m) => m['id'] != movie['id'])
        .take(6)
        .toList();

    // CupertinoPageScaffold con CupertinoNavigationBar
    return CupertinoPageScaffold(
      backgroundColor: AppTheme.netflixBlack,
      // CupertinoNavigationBar — reemplaza AppBar
      navigationBar: CupertinoNavigationBar(
        backgroundColor: const Color(0xE6000000),
        border: null,
        // CupertinoNavigationBarBackButton — boton "<" estilo iOS
        leading: CupertinoNavigationBarBackButton(
          color: AppTheme.netflixRed,
          onPressed: () => Navigator.pop(context),
        ),
        middle: Text(movie['title'] as String,
            style: AppTheme.sectionTitle(fontSize: 16),
            maxLines: 1,
            overflow: TextOverflow.ellipsis),
      ),
      child: CupertinoScrollbar(
        child: CustomScrollView(
          slivers: [
            // Poster
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  _buildPoster(movie),
                  const Positioned(
                    left: 0, right: 0, bottom: 0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [CupertinoColors.transparent, AppTheme.netflixBlack],
                          stops: [0.5, 1.0],
                        ),
                      ),
                      child: SizedBox(height: 120),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Titulo — Bebas Neue
                    Text(movie['title'] as String, style: AppTheme.heroTitle(fontSize: 40)),
                    const SizedBox(height: 8),
                    // Metadata
                    Row(
                      children: [
                        Text('${movie['year']}',
                            style: AppTheme.bodyText(fontSize: 14, color: const Color(0xFF66BB6A))
                                .copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            border: Border.all(color: CupertinoColors.systemGrey),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Text(movie['rating'] as String,
                              style: AppTheme.bodyText(fontSize: 11, color: CupertinoColors.systemGrey)),
                        ),
                        const SizedBox(width: 10),
                        Text(movie['duration'] as String,
                            style: AppTheme.bodyText(fontSize: 13, color: CupertinoColors.systemGrey)),
                      ],
                    ),
                    const SizedBox(height: 18),
                    // CupertinoButton blanco — Reproducir
                    SizedBox(
                      width: double.infinity,
                      child: CupertinoButton(
                        color: CupertinoColors.white,
                        borderRadius: BorderRadius.circular(6),
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(CupertinoIcons.play_fill, color: CupertinoColors.black, size: 20),
                            const SizedBox(width: 6),
                            Text('Reproducir',
                                style: AppTheme.sectionTitle(fontSize: 16)
                                    .copyWith(color: CupertinoColors.black)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // CupertinoButton gris — Mi lista
                    SizedBox(
                      width: double.infinity,
                      child: CupertinoButton(
                        color: AppTheme.netflixMediumGray,
                        borderRadius: BorderRadius.circular(6),
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(CupertinoIcons.add, color: CupertinoColors.white, size: 20),
                            const SizedBox(width: 6),
                            Text('Mi lista', style: AppTheme.sectionTitle(fontSize: 16)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Descripcion — Roboto
                    Text(movie['description'] as String, style: AppTheme.bodyText()),
                    const SizedBox(height: 12),
                    // Genero
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(text: 'Géneros: ',
                            style: AppTheme.bodyText(fontSize: 13, color: CupertinoColors.systemGrey)),
                        TextSpan(text: movie['genre'] as String,
                            style: AppTheme.bodyText(fontSize: 13)),
                      ]),
                    ),
                    const SizedBox(height: 28),
                    // Mas como esto — Montserrat
                    Text('Más como esto', style: AppTheme.sectionTitle(fontSize: 20)),
                    const SizedBox(height: 14),
                    SizedBox(
                      height: 195,
                      child: CupertinoScrollbar(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: related.length,
                          itemBuilder: (context, index) {
                            final rel = related[index];
                            return GestureDetector(
                              onTap: () => Navigator.pushReplacementNamed(
                                  context, '/detail', arguments: rel),
                              child: Container(
                                width: 115,
                                margin: const EdgeInsets.only(right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: rel['isLocal'] == true
                                          ? Image.asset('assets/images/poster_local.png',
                                              width: 115, height: 155, fit: BoxFit.cover)
                                          : Image.network(rel['imageUrl'] as String,
                                              width: 115, height: 155, fit: BoxFit.cover,
                                              loadingBuilder: (ctx, child, p) {
                                                if (p == null) return child;
                                                return Container(
                                                  width: 115, height: 155,
                                                  color: AppTheme.netflixMediumGray,
                                                  child: const Center(
                                                    child: CupertinoActivityIndicator(
                                                        color: CupertinoColors.white),
                                                  ),
                                                );
                                              },
                                              errorBuilder: (context, error, _) => Container(
                                                width: 115, height: 155,
                                                color: AppTheme.netflixMediumGray,
                                                child: const Icon(CupertinoIcons.film,
                                                    color: CupertinoColors.systemGrey),
                                              )),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(rel['title'] as String,
                                        style: AppTheme.bodyText(fontSize: 11,
                                            color: CupertinoColors.systemGrey),
                                        maxLines: 2, overflow: TextOverflow.ellipsis),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPoster(Map<String, dynamic> movie) {
    return SizedBox(
      height: 340, width: double.infinity,
      child: movie['isLocal'] == true
          ? Image.asset('assets/images/poster_local.png', fit: BoxFit.cover)
          : Image.network(
              movie['imageUrl'] as String,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, p) {
                if (p == null) return child;
                return Container(
                  color: AppTheme.netflixDarkGray,
                  child: const Center(
                    child: CupertinoActivityIndicator(color: CupertinoColors.white, radius: 18),
                  ),
                );
              },
              errorBuilder: (context, error, _) =>
                  Image.asset('assets/images/poster_local.png', fit: BoxFit.cover),
            ),
    );
  }
}
