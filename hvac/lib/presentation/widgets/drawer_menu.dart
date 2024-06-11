import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hvac/core/data/settings_repository.dart';
import 'package:hvac/core/entities/settings.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key, required this.userName});
  final String userName;

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    const textStyle = TextStyle(fontSize: 18);
    return NavigationDrawer(
      selectedIndex: selectedItem,
      onDestinationSelected: (index) {
        selectedItem = index;
        setState(() {
          if (index == 0) {
            context.go('/home_screen',
                extra: widget.userName); // Voy a la pantalla seleccionada
            context.pop(); // Cierro el drawer
          }
          if (index == 1) {
            creditDialog(context);
          }
          if (index == 2) {
            logoutDialog(context);
          }
        });
      },
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: colors.primary,
          ),
          child: Text(
            'Hola ${widget.userName}',
            style: TextStyle(fontSize: 25, color: colors.onPrimary),
          ),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.home),
          label: Text(
            'Inicio',
            style: textStyle,
          ),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.info),
          label: Text(
            'Acerca de HVAC',
            style: textStyle,
          ),
        ),
        const Divider(),
        const NavigationDrawerDestination(
          icon: Icon(Icons.logout),
          label: Text(
            'Cerrar Sesión',
            style: textStyle,
          ),
        ),
      ],
    );
  }

  void creditDialog(BuildContext context) {
    showAboutDialog(
      applicationName: 'HVAC',
      applicationVersion: '1.0',
      applicationIcon: ClipRect(
          child: Image.asset(
        'assets/images/hvac_logo.png',
        height: 64,
      )),
      context: context,
      children: [
        const Text(
          'Desarrollo de Aplicaciones Móviles\nComisión: R6051\n2024\nDesarrollado por Pablo Bronzone',
          style: TextStyle(fontSize: 15),
        ),
      ],
    );
  }

  void logoutDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cerrar Sesión'),
        content: const Text('¿Está seguro?'),
        actions: [
          TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('CANCELAR')),
          FilledButton(
              onPressed: () async {
                try {
                  await SettingRepository()
                      .updateSettings(Settings(id: 1, userId: -1));
                  context.go('/login_screen');
                } catch (e) {
                  context.go('/');
                }
              },
              child: const Text('OK')),
        ],
      ),
    );
  }
}
