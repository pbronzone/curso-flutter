import 'package:hvac/core/entities/hvac_device.dart';

final List<HvacDevice> hvacDeviceList = [
  HvacDevice(
      id: 1,
      name: 'Living',
      isOnline: true,
      status: true,
      temp: 23.0,
      setpoint: 24.0,
      mode: 'Cool',
      fan: 'Alto',
      type: 'wall',
      img: 'assets/images/wall.png'),
  HvacDevice(
      id: 2,
      name: 'Habitación',
      isOnline: true,
      status: true,
      temp: 23.0,
      setpoint: 24.0,
      mode: 'Cool',
      fan: 'Alto',
      type: 'ducted',
      img: 'assets/images/ducted.png'),
  HvacDevice(
      id: 3,
      name: 'Cocina',
      isOnline: false,
      status: true,
      temp: 23.0,
      setpoint: 24.0,
      mode: 'Cool',
      fan: 'Alto',
      type: 'cassete',
      img: 'assets/images/cassette.png'),
];
