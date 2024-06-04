import 'package:go_router/go_router.dart';
import 'package:hvac/presentation/screens/home_screen.dart';
import 'package:hvac/presentation/screens/login_screen.dart';
import 'package:hvac/presentation/screens/register_screen.dart';
import 'package:hvac/presentation/screens/splash_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/login_screen',
  routes: [
    GoRoute(
      path: '/',
      name: SplashScreen.name,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login_screen',
      name: LoginScreen.name,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home_screen',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/register_screen',
      name: RegisterScreen.name,
      builder: (context, state) => const RegisterScreen(),
    ),
  ],
);
