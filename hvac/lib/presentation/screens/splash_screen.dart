import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hvac/core/data/local_settings_repository.dart';
import 'package:hvac/core/data/user_repository.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String name = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final settingsRequest = LocalSettingsRepository().findAllSettings();
    final userRequest = UserRepository().findAllUsers();
    settingsRequest.then((result) {
      if (result.isEmpty) {
        //Si el resultado viene vacío escribo el default de la app
        LocalSettingsRepository().defaultSettings().then((result) {
          context.go('/login_screen');
        });
      } else {
        // Si no esta vacio, verifico que no sea null y si el user no está logeado
        final settings = result.firstWhereOrNull((element) => element.id == 1);
        if (settings != null && settings.userId == -1) {
          context.go('/login_screen');
        } else {
          // lanzo el request para luego pasar a la pantalla de home

          userRequest.then((value) {
            if (value.isEmpty) {
              context.go('/login_screen');
            } else {
              final user = value.firstWhereOrNull(
                  (element) => element.id == settings?.userId);
              if (user != null) {
                context.go('/home_screen', extra: user.userName);
              } else {
                context.go('/login_screen');
              }
            }
          }).catchError((e) {
            //Si ocurre algun error al leer la db de user
            context.go('/login_screen');
          });
        }
      }
    }).catchError((e) {
      // Si ocurre algun error en la lectura de la configuración escribo los valores por defecto y voy al login
      LocalSettingsRepository().defaultSettings().then((result) {
        context.go('/login_screen');
      });
    });
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
            /*const Padding(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: LinearProgressIndicator(
                value: 0.3,
              ),
            )*/
            const Padding(
              padding: EdgeInsets.all(60),
              child: LinearProgressIndicator(
                //strokeWidth: 4,
                backgroundColor: Colors.black26,
              ),
            )
          ],
        ),
      ),
    );
  }
}
