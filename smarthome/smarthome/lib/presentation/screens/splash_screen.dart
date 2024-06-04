import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:smarthome/core/app_router.dart';
import 'package:smarthome/presentation/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String name = 'splash_screen';

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/images/smarthomelogo.png'),
      title: const Text(
        "Smart Home App",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      showLoader: true,
      loadingText: const Text("Loading..."),
      navigator: LoginScreen(),
      durationInSeconds: 5,
    );
  }
}
