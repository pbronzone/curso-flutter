import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  static const String name = 'LoginScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _LoginView(),
    );
  }
}

class _LoginView extends StatefulWidget {
  _LoginView({
    super.key,
  });

  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> {
  TextEditingController userController = TextEditingController();

  TextEditingController passWordController = TextEditingController();

  bool? checkBoxValue = false;

  void showSnackBar(String message, BuildContext context) {
    SnackBar snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.book_outlined,
              size: 100,
            ),
            const Gap(20),
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
            const Gap(20),
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
            const Gap(20),
            CheckboxListTile(
              value: checkBoxValue,
              title: const Text('Mantener la sesión iniciada'),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (value) {
                setState(() {
                  checkBoxValue = value;
                });
              },
            ),
            const Gap(20),
            ElevatedButton(
                onPressed: () {
                  if (userController.text.isEmpty) {
                    showSnackBar('Usuario no puede estar vacío', context);
                  } /*else {
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
                  }*/
                },
                child: const Text(
                  'Ingresar',
                )),
          ],
        ),
      ),
    );
  }
}
