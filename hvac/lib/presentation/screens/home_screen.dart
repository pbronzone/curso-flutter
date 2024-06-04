import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hvac/core/data/hvac_device_datasource.dart';
import 'package:hvac/core/entities/hvac_device.dart';
import 'package:hvac/presentation/screens/widgets/drawer_menu.dart';

enum TypeHvacDevice { wall, cassette, ducted }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String name = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HVAC Home'),
      ),
      body: const _HomeView(),
      drawer: const DrawerMenu(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //addHvacDevice(context);
          showDialog(
            context: context,
            builder: (_) {
              return const MyDialog();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  /*void addHvacDevice(BuildContext context) {
    TextEditingController tagController = TextEditingController();
    TypeHvacDevice selectedType = TypeHvacDevice.wall;
    String selected = 'wall';
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Dialog.fullscreen(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Agregar dispositivo'),
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                context.pop();
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(50),
            child: Center(
                child: ListView(
              children: [
                TextField(
                  controller: tagController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Etiqueta',
                      prefixIcon: const Icon(
                        Icons.comment_outlined,
                      )),
                ),
                const Gap(10),
                ExpansionTile(
                  title: const Text('Tipo de equipo'),
                  subtitle: Text(selected),
                  children: [
                    RadioListTile(
                      value: TypeHvacDevice.wall.name,
                      groupValue: selectedType.name,
                      title: Text(TypeHvacDevice.wall.name),
                      subtitle: const Text('Equipo mural'),
                      onChanged: (value) {
                        setState(() {
                          selected = value!;
                        });
                      },
                    ),
                    RadioListTile(
                      value: TypeHvacDevice.cassette.name,
                      groupValue: selectedType.name,
                      title: Text(TypeHvacDevice.cassette.name),
                      subtitle: const Text('Equipo cassette'),
                      onChanged: (value) {
                        setState(() {
                          selected = value!;
                        });
                      },
                    ),
                    RadioListTile(
                      value: TypeHvacDevice.ducted.name,
                      groupValue: selectedType.name,
                      title: Text(TypeHvacDevice.ducted.name),
                      subtitle: const Text('Equipo oculto'),
                      onChanged: (value) {
                        setState(() {
                          selected = value!;
                        });
                      },
                    ),
                  ],
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }*/
}

class _HomeView extends StatelessWidget {
  const _HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: hvacDeviceList.length,
        itemBuilder: (context, index) {
          return _HvacDeviceItemView(item: hvacDeviceList[index]);
        });
  }
}

class _HvacDeviceItemView extends StatelessWidget {
  const _HvacDeviceItemView({
    super.key,
    required this.item,
  });
  final HvacDevice item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10),
      child: Card(
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(item.img as String),
          ),
          title: Text(item.name),
          subtitle: Row(
            children: [
              Text('Estado: ${item.status! ? 'ON' : 'OFF'}'),
              const Gap(10),
              Text('Temp: ${item.temp!}°C'),
            ],
          ),
          trailing: item.isOnline
              ? const Icon(Icons.wifi)
              : const Icon(Icons.wifi_off),
          onTap: () {},
        ),
      ),
    );
  }
}

class MyDialog extends StatefulWidget {
  const MyDialog({super.key});

  @override
  State<MyDialog> createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  TextEditingController tagController = TextEditingController();
  TypeHvacDevice selectedType = TypeHvacDevice.wall;

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Agregar dispositivo'),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              context.pop();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(50),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                TextField(
                  controller: tagController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Etiqueta',
                      prefixIcon: const Icon(
                        Icons.comment_outlined,
                      )),
                ),
                const Gap(10),
                ExpansionTile(
                  title: const Text('Tipo de equipo'),
                  subtitle: Text(selectedType.name),
                  children: [
                    RadioListTile(
                      value: TypeHvacDevice.wall,
                      groupValue: selectedType,
                      title: Text(TypeHvacDevice.wall.name),
                      subtitle: const Text('Equipo mural'),
                      onChanged: (value) {
                        setState(() {
                          selectedType = value as TypeHvacDevice;
                        });
                      },
                    ),
                    RadioListTile(
                      value: TypeHvacDevice.cassette,
                      groupValue: selectedType,
                      title: Text(TypeHvacDevice.cassette.name),
                      subtitle: const Text('Equipo cassette'),
                      onChanged: (value) {
                        setState(() {
                          selectedType = value as TypeHvacDevice;
                        });
                      },
                    ),
                    RadioListTile(
                      value: TypeHvacDevice.ducted,
                      groupValue: selectedType,
                      title: Text(TypeHvacDevice.ducted.name),
                      subtitle: const Text('Equipo oculto'),
                      onChanged: (value) {
                        setState(() {
                          selectedType = value as TypeHvacDevice;
                        });
                      },
                    ),
                  ],
                ),
                SafeArea(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: FilledButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: const Text('Guardar'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*AlertDialog(
              title: const Text('Agregar Dispositivo'),
              content: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Primero'),
                  Text('Segundo'),
                  Text('Tercero'),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: const Text('CANCELAR')),
                FilledButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: const Text('OK')),
              ],
            )); */