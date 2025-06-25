import 'package:go_router/go_router.dart';
import '../features/landing/presentation/pages/landing_page.dart';
import '../features/pokemon_detail/presentation/pages/pokemon_detail_page.dart';

class AppRouter {
  /// Main router instance with all app routes
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      // Landing page route
      GoRoute(
        path: '/',
        name: 'landing',
        builder: (context, state) => const LandingPage(),
      ),
      GoRoute(
        path: '/pokedex',
        name: 'pokedex',
        builder: (context, state) => const PokemonDetailPage(),
      ),
    ],
  );
}
