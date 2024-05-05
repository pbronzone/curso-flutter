import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:helloword/core/entities/users.dart';

class LoginScreen extends StatefulWidget {
  static const name = 'loginScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  final List<User> users = [
    User(user: 'Pablo', password: '1111'),
    User(user: 'Ceci', password: '2222'),
    User(user: 'dante', password: '777')
  ];
  User findUser(String user) =>
      users.firstWhere((element) => element.user == user,
          orElse: () => User(user: '', password: ''));

  void showSnackBar(String message, BuildContext context) {
    SnackBar snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*const DecoratedBox(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/logo.png')))),*/
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
                const SizedBox(
                  height: 20,
                ),
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
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (userController.text.isEmpty) {
                        showSnackBar('Usuario no puede estar vacío', context);
                      } else {
                        if (findUser(userController.text).user == '') {
                          showSnackBar('Usuario no encontrado', context);
                          userController.clear();
                          passWordController.clear();
                        } else {
                          if (findUser(userController.text).password !=
                              passWordController.text) {
                            showSnackBar('Contraseña incorrecta', context);
                            passWordController.clear();
                          } else {
                            context.push('/home',
                                extra: findUser(userController.text).user);
                          }
                        }
                      }
                    },
                    child: const Text(
                      'Ingresar',
                    )),
              ],
            )));
  }
}
