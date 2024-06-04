import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static const String name = 'RegisterScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Usuario'),
      ),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatefulWidget {
  const _RegisterView({
    super.key,
  });

  @override
  State<_RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<_RegisterView> {
  TextEditingController userController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  TextEditingController passWordCheckController = TextEditingController();
  bool? termsCheckBoxValue = false;

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
            controller: passWordController,
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
                setState(() {
                  termsCheckBoxValue = value;
                  print(termsCheckBoxValue);
                });
              },
            ),
          ),
          FilledButton(
            onPressed: () {
              context.go('/login_screen');
              /*if (userController.text.isEmpty) {
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
                  }*/*/
            },
            child: const Text(
              'Registrarse',
            ),
          ),
        ],
      ),
    );
  }
}
