import 'package:go_router/go_router.dart';
import 'package:helloword/presentation/screens/home_screen.dart';
import 'package:helloword/presentation/screens/login_screen.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    name: LoginScreen.name,
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: '/home',
    name: HomeScreen.name,
    builder: (context, state) => HomeScreen(
      username: state.extra as String,
    ),
  )
]);
