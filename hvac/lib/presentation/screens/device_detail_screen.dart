import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hvac/core/data/local_hvac_device_repository.dart';
import 'package:hvac/core/entities/hvac_device.dart';

enum Fan { low, medium, high }

enum Mode { auto, cool, heat }

class DeviceDetailScreen extends StatefulWidget {
  const DeviceDetailScreen({
    super.key,
    required this.hvacDeviceId,
  });
  static const String name = 'DeviceDetailScreen';
  final int hvacDeviceId;

  @override
  State<DeviceDetailScreen> createState() => _DeviceDetailScreenState();
}

class _DeviceDetailScreenState extends State<DeviceDetailScreen> {
  late Future<HvacDevice?> deviceRequest;

  @override
  void initState() {
    super.initState();
    deviceRequest =
        LocalHvacDeviceRepository().findDeviceById(widget.hvacDeviceId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: /*(deviceRequest != null) ? Text(deviceRequest.name) : */
              const Text('Dispositivo'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.pop(true);
            },
          ),
          actions: [
            PopupMenuButton(
              onSelected: (index) => handleClick(context, index),
              itemBuilder: (context) => [
                const PopupMenuItem(value: 0, child: Text('Editar')),
                const PopupMenuItem(value: 1, child: Text('Borrar')),
              ],
            ),
          ],
        ),
        body: FutureBuilder(
            future: deviceRequest,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasData && snapshot.data != null) {
                  return _DeviceDetailView(hvacDevice: snapshot.data!);
                } else {
                  return const Center(
                      child: Text('No hay detalles para mostrar'));
                }
              }
            }));
    /*(device != null)
          ? _DeviceDetailView(
              hvacDevice: device,
            )
          : const Text('Nada para mostrar'),*/
  }

  void handleClick(BuildContext context, item) {
    switch (item) {
      case 0:
        editDialog(context);
        break;
      case 1:
        deleteDialog(context);
        break;
    }
  }

  void editDialog(BuildContext context) async {
    TextEditingController name = TextEditingController();
    final bool refresh = await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Editar Nombre'),
              content: TextField(
                controller: name,
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      context.pop(false);
                    },
                    child: const Text('CANCELAR')),
                FilledButton(
                    onPressed: () async {
                      HvacDevice? actual = await LocalHvacDeviceRepository()
                          .findDeviceById(widget.hvacDeviceId);
                      if (actual != null) {
                        actual.name = name.text;
                        await LocalHvacDeviceRepository().updateDevice(actual);
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('El dispositivo no existe'),
                          duration: Duration(seconds: 1),
                        ));
                      }
                      context.pop(true);
                    },
                    child: const Text('OK')),
              ],
            )) as bool;
    if (refresh) {
      deviceRequest =
          LocalHvacDeviceRepository().findDeviceById(widget.hvacDeviceId);
      setState(() {});
    }
  }

  void deleteDialog(BuildContext context) async {
    final bool refresh = await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Eliminar Dispositivo'),
              content: const Text('¿Está seguro?'),
              actions: [
                TextButton(
                    onPressed: () {
                      context.pop(false);
                    },
                    child: const Text('CANCELAR')),
                FilledButton(
                    onPressed: () async {
                      HvacDevice? actual = await LocalHvacDeviceRepository()
                          .findDeviceById(widget.hvacDeviceId);
                      await LocalHvacDeviceRepository().deleteDevice(actual!);
                      context.pop(true);
                    },
                    child: const Text('OK')),
              ],
            ));
    if (refresh) {
      deviceRequest =
          LocalHvacDeviceRepository().findDeviceById(widget.hvacDeviceId);
      setState(() {});
    }
  }
}

class _DeviceDetailView extends StatefulWidget {
  final HvacDevice hvacDevice;

  const _DeviceDetailView({
    required this.hvacDevice,
  });

  @override
  State<_DeviceDetailView> createState() => _DeviceDetailViewState();
}

class _DeviceDetailViewState extends State<_DeviceDetailView> {
  static const textStyle = TextStyle(fontSize: 28);
  late Fan fanView;
  late Mode modeView;
  late bool statusSwitch;
  late double setpoint;

  @override
  void initState() {
    /*HvacDevice item = hvacDeviceList
        .firstWhere((element) => element.id == widget.deviceDetailId);*/
    fanView = Fan.values.firstWhere(
        (element) => element.name.toString() == widget.hvacDevice.fan);
    modeView = Mode.values.firstWhere(
        (element) => element.name.toString() == widget.hvacDevice.mode);
    statusSwitch = widget.hvacDevice.status ?? true;
    setpoint = widget.hvacDevice.setpoint ?? 24;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            widget.hvacDevice.name,
            style: textStyle,
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: ClipRect(
                child: Image.asset(
              widget.hvacDevice.img!,
            )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    IconButton(
                      onPressed: () {
                        statusSwitch = !statusSwitch;
                        setState(() {});
                      },
                      icon: const Icon(Icons.power_settings_new_outlined),
                      iconSize: 48,
                      style: ButtonStyle(
                          iconColor: MaterialStatePropertyAll(statusSwitch
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.onBackground)),
                    )
                  ],
                ),
                const Gap(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        IconButton(
                          onPressed: () {
                            setpoint--;
                            setState(() {});
                          },
                          icon: const Icon(Icons.arrow_back_ios),
                          style: ButtonStyle(
                              iconColor: MaterialStatePropertyAll(
                                  Theme.of(context).colorScheme.primary)),
                        ),
                        Text(
                          '$setpoint°',
                          style: textStyle,
                        ),
                        IconButton(
                          onPressed: () {
                            setpoint++;
                            setState(() {});
                          },
                          icon: const Icon(Icons.arrow_forward_ios),
                          style: ButtonStyle(
                              iconColor: MaterialStatePropertyAll(
                                  Theme.of(context).colorScheme.primary)),
                        ),
                      ],
                    ),
                  ],
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SegmentedButton(
                        style: const ButtonStyle(
                            fixedSize: MaterialStatePropertyAll(Size(150, 40))),
                        showSelectedIcon: false,
                        segments: const <ButtonSegment<Mode>>[
                          ButtonSegment<Mode>(
                              value: Mode.auto,
                              icon: Icon(Icons.hdr_auto_outlined)),
                          ButtonSegment<Mode>(
                              value: Mode.cool, icon: Icon(Icons.ac_unit)),
                          ButtonSegment<Mode>(
                              value: Mode.heat,
                              icon: Icon(Icons.brightness_5_outlined)),
                        ],
                        selected: <Mode>{modeView},
                        onSelectionChanged: (Set<Mode> newSelection) {
                          setState(() {
                            modeView = newSelection.first;
                          });
                        }),
                  ],
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SegmentedButton(
                        showSelectedIcon: false,
                        segments: const <ButtonSegment<Fan>>[
                          ButtonSegment<Fan>(
                              value: Fan.low,
                              icon: Icon(Icons.signal_cellular_alt_1_bar)),
                          ButtonSegment<Fan>(
                              value: Fan.medium,
                              icon: Icon(Icons.signal_cellular_alt_2_bar)),
                          ButtonSegment<Fan>(
                              value: Fan.high,
                              icon: Icon(Icons.signal_cellular_alt_outlined)),
                        ],
                        selected: <Fan>{fanView},
                        onSelectionChanged: (Set<Fan> newSelection) {
                          setState(() {
                            fanView = newSelection.first;
                          });
                        }),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
