import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/app_data.dart';
import '../theme/app_theme.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Recibe el mapa de la película desde la ruta
    final movie =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    // Películas relacionadas (todas menos la actual)
    final related = AppData.trendingMovies
        .where((m) => m['id'] != movie['id'])
        .take(6)
        .toList();

    return Scaffold(
      backgroundColor: AppTheme.netflixBlack,
      body: CustomScrollView(
        slivers: [
          // AppBar con imagen de portada expandible
          SliverAppBar(
            expandedHeight: 360,
            pinned: true,
            backgroundColor: AppTheme.netflixBlack,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Imagen del poster (local o red segun la pelicula)
                  _buildPoster(movie),
                  // Gradiente oscuro de abajo
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, AppTheme.netflixBlack],
                        stops: [0.5, 1.0],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Titulo — Fuente 1: Bebas Neue
                  Text(
                    movie['title'] as String,
                    style: GoogleFonts.bebasNeue(
                      fontSize: 42,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Fila de metadatos
                  Row(
                    children: [
                      // Año
                      Text(
                        '${movie['year']}',
                        style: GoogleFonts.roboto(
                          color: Colors.green[400],
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Rating
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[600]!),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Text(
                          movie['rating'] as String,
                          style: GoogleFonts.roboto(
                            color: Colors.grey[400],
                            fontSize: 11,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Duracion
                      Text(
                        movie['duration'] as String,
                        style: GoogleFonts.roboto(
                          color: Colors.grey[400],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Boton Reproducir
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.black,
                        size: 26,
                      ),
                      label: Text(
                        'Reproducir',
                        // Fuente 2: Montserrat para botones
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Boton Mi lista
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                      label: Text(
                        'Mi lista',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.netflixGray,
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Descripcion — Fuente 3: Roboto
                  Text(
                    movie['description'] as String,
                    style: GoogleFonts.roboto(
                      fontSize: 15,
                      color: Colors.white.withAlpha(220),
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Genero con RichText
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Géneros: ',
                          style: GoogleFonts.roboto(
                            color: Colors.grey[500],
                            fontSize: 13,
                          ),
                        ),
                        TextSpan(
                          text: movie['genre'] as String,
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Seccion "Mas como esto" — Fuente 2: Montserrat
                  Text(
                    'Más como esto',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 14),

                  // ListView horizontal de peliculas relacionadas
                  SizedBox(
                    height: 195,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: related.length,
                      itemBuilder: (context, index) {
                        final rel = related[index];
                        return GestureDetector(
                          onTap: () => Navigator.pushReplacementNamed(
                            context,
                            '/detail',
                            arguments: rel,
                          ),
                          child: Container(
                            width: 115,
                            margin: const EdgeInsets.only(right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: rel['isLocal'] == true
                                      ? Image.asset(
                                          'assets/images/poster_local.png',
                                          width: 115,
                                          height: 155,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.network(
                                          rel['imageUrl'] as String,
                                          width: 115,
                                          height: 155,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, _) =>
                                              Container(
                                            width: 115,
                                            height: 155,
                                            color: AppTheme.netflixGray,
                                            child: const Icon(
                                              Icons.movie,
                                              color: Colors.white30,
                                            ),
                                          ),
                                        ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  rel['title'] as String,
                                  style: GoogleFonts.roboto(
                                    fontSize: 11,
                                    color: Colors.grey[400],
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
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

  Widget _buildPoster(Map<String, dynamic> movie) {
    if (movie['isLocal'] == true) {
      return Image.asset(
        'assets/images/poster_local.png',
        fit: BoxFit.cover,
      );
    }
    return Image.network(
      movie['imageUrl'] as String,
      fit: BoxFit.cover,
      errorBuilder: (context, error, _) => Image.asset(
        'assets/images/poster_local.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
