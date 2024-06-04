import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String name = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRect(
                  child: Image.asset(
                'assets/images/hvac_logo.png',
              )),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: LinearProgressIndicator(
                value: 0.3,
              ),
            )
            /*const Padding(
              padding: EdgeInsets.all(50),
              child: CircularProgressIndicator(
                strokeWidth: 4,
                backgroundColor: Colors.black26,
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
