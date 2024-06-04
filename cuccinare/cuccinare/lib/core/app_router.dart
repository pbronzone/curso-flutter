import 'package:cuccinare/presentation/screens/home_screen.dart';
import 'package:cuccinare/presentation/screens/recipe_detail_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/home', routes: [
  GoRoute(
    path: '/home',
    name: HomeScreen.name,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/recipe_detail_screen',
    name: RecipeDetailScreen.name,
    builder: (context, state) => const RecipeDetailScreen(),
  ),
]);
