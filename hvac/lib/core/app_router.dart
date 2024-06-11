import 'package:go_router/go_router.dart';
import 'package:hvac/presentation/screens/device_detail_screen.dart';
import 'package:hvac/presentation/screens/home_screen.dart';
import 'package:hvac/presentation/screens/login_screen.dart';
import 'package:hvac/presentation/screens/register_screen.dart';
import 'package:hvac/presentation/screens/splash_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
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
      builder: (context, state) => HomeScreen(
        userName: state.extra as String,
      ),
    ),
    GoRoute(
      path: '/register_screen',
      name: RegisterScreen.name,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/device_detail_screen/:hvacDeviceId',
      name: DeviceDetailScreen.name,
      builder: (context, state) {
        final hvacDeviceId = state.pathParameters['hvacDeviceId'];
        return DeviceDetailScreen(
          hvacDeviceId: int.tryParse(hvacDeviceId ?? '') ?? -1,
        );
      },
    ),
  ],
);
