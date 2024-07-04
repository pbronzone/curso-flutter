import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hvac/core/data/local_hvac_device_repository.dart';
import 'package:hvac/core/entities/hvac_device.dart';
import 'package:hvac/presentation/utils/base_state.dart';
import 'package:hvac/presentation/utils/type_hvac_device.dart';
import 'package:hvac/presentation/viewmodels/providers.dart';
import 'package:hvac/presentation/viewmodels/states/home_state.dart';
import 'package:hvac/presentation/widgets/drawer_menu.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key, required this.userName});
  static const String name = 'HomeScreen';
  final String userName;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  //late Future<List<HvacDevice>> deviceList;

  @override
  void initState() {
    //deviceList = LocalHvacDeviceRepository().findAllDevices();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeViewModelProvider.notifier).fetchDevices();
    });
  }

  @override
  Widget build(BuildContext context) {
    final HomeState state = ref.watch(homeViewModelProvider);

    final body = switch (state.screenState) {
      BaseState.loading => const Center(child: CircularProgressIndicator()),
      BaseState.idle => ListView.builder(
          itemCount: state.hvacDeviceList.length,
          itemBuilder: (context, index) {
            return _HvacDeviceItemView(
              item: state.hvacDeviceList[index],
              onItemTap: () async {
                goToDetails(context, state.hvacDeviceList[index]);
              },
            );
          }),
      BaseState.error => Text('${state.error}'),
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('HVAC Home'),
      ),
      body: body,
      /*FutureBuilder(
          future: deviceList,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasData) {
                final hvacDeviceList = snapshot.data!;
                return ListView.builder(
                    itemCount: hvacDeviceList.length,
                    itemBuilder: (context, index) {
                      final device = hvacDeviceList[index];
                      return _HvacDeviceItemView(
                        item: device,
                        onItemTap: () async {
                          goToDetails(context, device);
                        },
                      );
                    });
              } else {
                return Text(snapshot.error.toString());
              }
            }
          }),*/
      drawer: DrawerMenu(userName: widget.userName),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            final bool refresh = await showDialog(
              context: context,
              builder: (context) {
                return const AddDevice();
              },
            ) as bool;
            if (refresh) {
              /*deviceList = LocalHvacDeviceRepository().findAllDevices();
              setState(() {});*/ //TODO Implementar con Riverpod
              await ref.read(homeViewModelProvider.notifier).refreshDevices();
            }
          } catch (e) {
            print('Error desconocido $e');
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void goToDetails(BuildContext context, HvacDevice device) async {
    try {
      if (!device.isOnline) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('El dispositivo se encuetra fuera de línea'),
          duration: Duration(seconds: 1),
        ));
      }
      final bool refresh =
          await context.push('/device_detail_screen/${device.id}') as bool;
      if (refresh) {
        /*deviceList = LocalHvacDeviceRepository().findAllDevices();
        setState(() {}); //TODO Implementar con Riverpod*/
        await ref.read(homeViewModelProvider.notifier).refreshDevices();
      }
    } catch (e) {
      print('Error $e');
    }
  }
}

class _HvacDeviceItemView extends StatelessWidget {
  const _HvacDeviceItemView({
    required this.item,
    this.onItemTap,
  });
  final HvacDevice item;
  final Function? onItemTap;
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
              Icon(
                Icons.power_settings_new_outlined,
                color: item.status!
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onBackground,
                size: 24,
              ),
              const Gap(10),
              const Icon(
                Icons.thermostat,
                size: 22,
              ),
              const Gap(2),
              Text(
                '${item.temp ?? '-'}°',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
          trailing: item.isOnline
              ? const Icon(Icons.wifi)
              : const Icon(Icons.wifi_off),
          onTap: () => onItemTap?.call(),
        ),
      ),
    );
  }
}

class AddDevice extends StatefulWidget {
  const AddDevice({super.key});

  @override
  State<AddDevice> createState() => _AddDeviceState();
}

//TODO Pasar a una nueva Screen
class _AddDeviceState extends State<AddDevice> {
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
              context.pop(false);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(40),
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
                SegmentedButton(
                    showSelectedIcon: true,
                    segments: const <ButtonSegment<TypeHvacDevice>>[
                      ButtonSegment<TypeHvacDevice>(
                        value: TypeHvacDevice.wall,
                        label: Text('Mural'),
                      ),
                      ButtonSegment<TypeHvacDevice>(
                        value: TypeHvacDevice.ducted,
                        label: Text('Oculto'),
                      ),
                      ButtonSegment<TypeHvacDevice>(
                        value: TypeHvacDevice.cassette,
                        label: Text('Cassette'),
                      ),
                    ],
                    selected: <TypeHvacDevice>{selectedType},
                    onSelectionChanged: (Set<TypeHvacDevice> newSelection) {
                      setState(() {
                        //TODO Implementar con Riverpod
                        selectedType = newSelection.first;
                      });
                    }),
                const Gap(20),
                SafeArea(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: FilledButton(
                      onPressed: () async {
                        if (tagController.text.isEmpty) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content:
                                Text('El campo etiqueta no puede estar vacío'),
                            duration: Duration(seconds: 1),
                          ));
                        } else {
                          //TODO Implementar con Riverpod
                          HvacDevice newDevice = getDeviceState(
                              tagController.text, selectedType.name);
                          await LocalHvacDeviceRepository()
                              .insertDevice(newDevice);
                          context.pop(true);
                        }
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

HvacDevice getDeviceState(String name, String type) {
  double random = Random().nextDouble();
  return HvacDevice(
      name: name,
      isOnline: random > 0.1,
      status: random > 0.34,
      temp: (20 + 10 * random).floorToDouble(),
      setpoint: (21 + 5 * random).floorToDouble(),
      mode: (random > 0.78) ? 'auto' : (random < 0.56 ? 'heat' : 'cool'),
      fan: (random > 0.78) ? 'high' : (random < 0.56 ? 'medium' : 'low'),
      type: type,
      img: 'assets/images/$type.png');
}
