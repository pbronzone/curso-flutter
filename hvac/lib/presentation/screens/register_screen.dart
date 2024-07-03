import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hvac/core/data/user_repository.dart';
import 'package:hvac/core/entities/user.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static const String name = 'RegisterScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Usuario'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop(true);
          },
        ),
      ),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatefulWidget {
  const _RegisterView();

  @override
  State<_RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<_RegisterView> {
  TextEditingController userController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  TextEditingController passWordCheckController = TextEditingController();
  bool termsCheckBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
          const Gap(10),
          TextField(
            controller: passWordCheckController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Confirmar contraseña',
                prefixIcon: const Icon(
                  Icons.key,
                )),
            obscureText: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CheckboxListTile(
              value: termsCheckBoxValue,
              title: const Text('Aceptar los términos de uso.'),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (value) {
                termsCheckBoxValue = !termsCheckBoxValue;
                setState(() {
                  //print(termsCheckBoxValue);
                });
              },
            ),
          ),
          FilledButton(
            onPressed: () async {
              //context.go('/login_screen');
              if (userController.text.isEmpty) {
                showSnackBar('Usuario no puede estar vacío', context);
              }
              if (passWordController.text.isEmpty) {
                showSnackBar('Contraseña no puede estar vacío', context);
              }
              if (passWordCheckController.text.isEmpty) {
                showSnackBar('Contraseña no puede estar vacío', context);
              }
              if (!termsCheckBoxValue) {
                showSnackBar('Debe aceptar los términos de uso', context);
              } else {
                if (userController.text.isNotEmpty &&
                    passWordController.text.isNotEmpty &&
                    passWordController.text == passWordCheckController.text) {
                  User newUser = User(
                    userName: userController.text,
                    password: passWordController.text,
                    isLoggedIn: false,
                  );
                  await UserRepository().insertUser(newUser);
                  context.pop(true);
                } else {
                  showSnackBar('No coincide la contraseña', context);
                  passWordController.clear();
                  passWordCheckController.clear();
                }
              }
            },
            child: const Text(
              'Registrarse',
            ),
          ),
        ],
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
