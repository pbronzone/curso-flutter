import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hvac/core/data/settings_repository.dart';
import 'package:hvac/core/data/user_repository.dart';
import 'package:hvac/core/entities/settings.dart';
import 'package:hvac/core/entities/user.dart';

class LoginScreen extends StatefulWidget {
  static const String name = 'LoginScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _LoginView(),
    );
  }
}

class _LoginView extends StatefulWidget {
  const _LoginView();

  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> {
  TextEditingController userController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  bool? checkBoxValue = false;
  late Future<List<User>> users;

  @override
  void initState() {
    super.initState();
    users = UserRepository().findAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ClipRect(
                    child: Image.asset(
                  'assets/images/hvac_logo.png',
                  height: 200,
                )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TextField(
                      controller: userController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Usuario',
                          prefixIcon: const Icon(
                            Icons.person,
                          )),
                    ),
                    const Gap(10),
                    TextField(
                      controller: passWordController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Contraseña',
                          prefixIcon: const Icon(
                            Icons.key,
                          )),
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CheckboxListTile(
                  value: checkBoxValue,
                  title: const Text('Mantener la sesión iniciada'),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (value) {
                    setState(() {
                      checkBoxValue = value;
                      //print(checkBoxValue);
                    });
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  //context.go('/home_screen');
                  if (userController.text.isEmpty) {
                    showSnackBar('Usuario no puede estar vacío', context);
                  } else {
                    try {
                      List<User> userList = await users;
                      User? userdb = userList.firstWhereOrNull(
                          (element) => element.userName == userController.text);
                      if (userdb == null) {
                        showSnackBar('Usuario no encontrado', context);
                        userController.clear();
                        passWordController.clear();
                      } else {
                        if (userdb.password == passWordController.text) {
                          if (checkBoxValue ?? false) {
                            userdb.isLoggedIn = true;
                            await UserRepository().updateUser(userdb);
                            await SettingRepository().updateSettings(
                                Settings(id: 1, userId: userdb.id ?? -1));
                          }
                          context.go(
                            '/home_screen',
                            extra: userdb.userName,
                          );
                        } else {
                          showSnackBar('Contraseña incorrecta', context);
                          passWordController.clear();
                        }
                      }
                    } catch (e) {
                      showSnackBar('Algo salió mal $e', context);
                    }
                  }
                },
                child: const Text(
                  'Ingresar',
                ),
              ),
              const Gap(10),
              FilledButton(
                onPressed: () async {
                  final bool refresh =
                      await context.push('/register_screen') as bool;
                  if (refresh) {
                    users = UserRepository().findAllUsers();
                  }
                },
                child: const Text(
                  'Registrarse',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showSnackBar(String message, BuildContext context) {
    SnackBar snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
