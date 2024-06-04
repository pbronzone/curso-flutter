import 'package:go_router/go_router.dart';
import 'package:smarthome/presentation/screens/home_screen.dart';
import 'package:smarthome/presentation/screens/item_screen.dart';
import 'package:smarthome/presentation/screens/login_screen.dart';
import 'package:smarthome/presentation/screens/singup_screen.dart';
import 'package:smarthome/presentation/screens/splash_screen.dart';
import 'package:smarthome/presentation/screens/user_detail_screen.dart';

final GoRouter appRouter = GoRouter(initialLocation: '/splash_screen', routes: [
  GoRoute(
    path: '/splash_screen',
    name: SplashScreen.name,
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: '/login_screen',
    name: LoginScreen.name,
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: '/singup_screen',
    name: SingUpScreen.name,
    builder: (context, state) => const SingUpScreen(),
  ),
  GoRoute(
    path: '/home',
    name: HomeScreen.name,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/item_screen',
    name: ItemScreen.name,
    builder: (context, state) => const ItemScreen(),
  ),
  GoRoute(
    path: '/user_detail_screen',
    name: UserDetailScreen.name,
    builder: (context, state) => const UserDetailScreen(),
  ),
]);
