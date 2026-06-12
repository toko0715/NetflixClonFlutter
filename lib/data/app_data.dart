import 'package:flutter/cupertino.dart';

class AppData {
  // Lista de peliculas en tendencia (List of Maps)
  static final List<Map<String, dynamic>> trendingMovies = [
    {
      'id': 1,
      'title': 'Intercambiados',
      'rank': 1,
      'imageUrl': 'https://picsum.photos/seed/intercambiados/300/450',
      'isLocal': true, // usa imagen local como demo
      'description':
          'Dos jóvenes intercambian cuerpos de forma inesperada y deben navegar la vida del otro mientras buscan la manera de volver a ser ellos mismos. Una aventura animada llena de humor y emoción para toda la familia.',
      'year': 2024,
      'genre': 'Animación, Comedia, Familia',
      'rating': 'PG',
      'duration': '1h 45min',
    },
    {
      'id': 2,
      'title': 'Berlín: La Dama del Armiño',
      'rank': 2,
      'imageUrl': 'https://picsum.photos/seed/berlin2024/300/450',
      'isLocal': false,
      'description':
          'Un misterio que combina arte, crimen y romance en el corazón de Europa. Berlín regresa con una historia que te dejará sin aliento.',
      'year': 2024,
      'genre': 'Drama, Crimen, Suspense',
      'rating': 'TV-MA',
      'duration': '8 episodios',
    },
    {
      'id': 3,
      'title': 'Un amor que no se agota',
      'rank': 3,
      'imageUrl': 'https://picsum.photos/seed/amorcorea/300/450',
      'isLocal': false,
      'description':
          'Una historia de amor que trasciende el tiempo y los obstáculos de la vida moderna. Dos almas destinadas a encontrarse en el momento menos esperado.',
      'year': 2024,
      'genre': 'Romance, Drama',
      'rating': 'TV-14',
      'duration': '16 episodios',
    },
    {
      'id': 4,
      'title': 'Ápex',
      'rank': 4,
      'imageUrl': 'https://picsum.photos/seed/apexaction/300/450',
      'isLocal': false,
      'description':
          'Un thriller de acción que lleva a los protagonistas al límite absoluto en un mundo de supervivencia extrema donde cada decisión puede ser la última.',
      'year': 2025,
      'genre': 'Acción, Thriller, Aventura',
      'rating': 'R',
      'duration': '2h 05min',
    },
    {
      'id': 5,
      'title': 'The Wonderfools',
      'rank': 5,
      'imageUrl': 'https://picsum.photos/seed/wonderfools2024/300/450',
      'isLocal': false,
      'description':
          'Un grupo de inadaptados se une para enfrentar los mayores desafíos de sus vidas con humor, camaradería y mucho corazón.',
      'year': 2024,
      'genre': 'Comedia, Aventura',
      'rating': 'TV-14',
      'duration': '8 episodios',
    },
    {
      'id': 6,
      'title': 'La Casa de Papel: Berlín 2',
      'rank': 6,
      'imageUrl': 'https://picsum.photos/seed/casadepapel6/300/450',
      'isLocal': false,
      'description':
          'El mayor ladrón de Europa regresa con un plan aún más ambicioso que expande el universo de La Casa de Papel.',
      'year': 2024,
      'genre': 'Crimen, Drama, Acción',
      'rating': 'TV-MA',
      'duration': '10 episodios',
    },
    {
      'id': 7,
      'title': 'El Gran Diluvio',
      'rank': 7,
      'imageUrl': 'https://picsum.photos/seed/grandiluv/300/450',
      'isLocal': false,
      'description':
          'Una catástrofe climática sin precedentes pone a prueba los límites de la humanidad en esta épica historia de supervivencia y redención.',
      'year': 2025,
      'genre': 'Ciencia ficción, Drama',
      'rating': 'TV-MA',
      'duration': '2h 30min',
    },
    {
      'id': 8,
      'title': 'Perfil Falso',
      'rank': 8,
      'imageUrl': 'https://picsum.photos/seed/perfilfalso8/300/450',
      'isLocal': false,
      'description':
          'Una exitosa abogada se enamora de un misterioso hombre que conoció en una app de citas. Nada es lo que parece en este apasionante thriller romántico.',
      'year': 2024,
      'genre': 'Thriller, Romance',
      'rating': 'TV-MA',
      'duration': '7 episodios',
    },
  ];

  // Lista de razones para unirse (List of Maps con iconos)
  static final List<Map<String, dynamic>> features = [
    {
      'title': 'Disfruta en tu TV',
      'description':
          'Ve en smart TV, PlayStation, Xbox, Chromecast, Apple TV, reproductores de Blu-ray y más.',
      'icon': CupertinoIcons.tv,
      'gradient': [Color(0xFF1A1A3E), Color(0xFF2D1B4E)],
    },
    {
      'title': 'Descarga tus series para verlas offline',
      'description':
          'Guarda tu contenido favorito y siempre tendrás algo para ver.',
      'icon': CupertinoIcons.arrow_down_circle_fill,
      'gradient': [Color(0xFF1A1A3E), Color(0xFF3D1B5E)],
    },
    {
      'title': 'Disfruta donde quieras',
      'description':
          'Películas y series ilimitadas en tu teléfono, tablet, laptop y TV.',
      'icon': CupertinoIcons.device_phone_portrait,
      'gradient': [Color(0xFF1A1A3E), Color(0xFF2D1B4E)],
    },
    {
      'title': 'Crea perfiles para niños',
      'description':
          'Los niños vivirán aventuras con sus personajes favoritos en un espacio diseñado exclusivamente para ellos, gratis con tu membresía.',
      'icon': CupertinoIcons.smiley,
      'gradient': [Color(0xFF1A1A3E), Color(0xFF3D1B5E)],
    },
  ];

  // Preguntas frecuentes (List of Maps)
  static final List<Map<String, String>> faqItems = [
    {
      'question': '¿Qué es Netflix?',
      'answer':
          'Netflix es un servicio de streaming que ofrece una gran variedad de películas, series y documentales premiados en casi cualquier pantalla conectada a internet.\n\nTodo lo que quieras ver, sin límites ni comerciales, a un costo muy accesible. Siempre hay algo nuevo por descubrir, ¡y todas las semanas se agregan más películas y series!',
    },
    {
      'question': '¿Cuánto cuesta Netflix?',
      'answer':
          'Disfruta de Netflix en tu smartphone, tablet, smart TV, laptop o dispositivo de streaming, todo por una tarifa mensual fija. Los planes van desde S/ 28.90 al mes. Sin costos adicionales ni contratos.',
    },
    {
      'question': '¿Dónde puedo ver Netflix?',
      'answer':
          'Puedes ver Netflix en casi cualquier lugar y en cualquier momento. Inicia sesión con tu cuenta en netflix.com desde tu computadora o en cualquier dispositivo conectado a internet, incluyendo smart TV, smartphones, tablets, reproductores de medios de streaming y consolas de videojuegos.',
    },
    {
      'question': '¿Cómo cancelo?',
      'answer':
          'Netflix es flexible. No hay contratos molestos ni compromisos. Puedes cancelar tu cuenta de manera online fácilmente con dos clicks. No hay cargos de cancelación: puedes abrir o cerrar tu cuenta cuando quieras.',
    },
    {
      'question': '¿Qué puedo ver en Netflix?',
      'answer':
          'Netflix tiene un extenso catálogo de largometrajes, documentales, series, anime y originales de Netflix. ¡Mira todo lo que quieras, cuando quieras!',
    },
    {
      'question': '¿Es bueno Netflix para los niños?',
      'answer':
          'La experiencia de Netflix para niños está incluida en tu membresía para que los niños más pequeños disfruten contenido apto para ellos en un entorno seguro. Los perfiles infantiles incluyen controles parentales que permiten bloquear contenido que no desees que vean.',
    },
  ];

  // Links del footer (List of Maps)
  static final List<Map<String, String>> footerLinks = [
    {'text': 'Preguntas frecuentes'},
    {'text': 'Centro de ayuda'},
    {'text': 'Cuenta'},
    {'text': 'Prensa'},
    {'text': 'Relaciones con inversionistas'},
    {'text': 'Empleo'},
    {'text': 'Canjear tarjetas de regalo'},
    {'text': 'Comprar tarjetas de regalo'},
    {'text': 'Formas de ver'},
    {'text': 'Términos de uso'},
    {'text': 'Privacidad'},
    {'text': 'Preferencias de cookies'},
    {'text': 'Información corporativa'},
    {'text': 'Contáctanos'},
    {'text': 'Prueba de velocidad'},
    {'text': 'Avisos legales'},
    {'text': 'Solo en Netflix'},
  ];
}
