import 'package:go_router/go_router.dart';
import 'package:listview/presentation/screens/movie_detail_screen.dart';
import 'package:listview/presentation/screens/movies_screen.dart';

final appRouter = GoRouter(initialLocation: '/movies', routes: [
  GoRoute(
    path: '/movies',
    name: MoviesScreen.name,
    builder: (context, state) => const MoviesScreen(),
  ),
  GoRoute(
    path: '/movie_detail_screen/:movieId',
    name: MovieDetailScreen.name,
    builder: (context, state) => MovieDetailScreen(
      movieId: state.pathParameters['movieId']!,
    ),
  )
]);
