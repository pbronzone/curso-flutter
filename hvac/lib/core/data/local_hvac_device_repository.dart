import 'package:hvac/core/domain/hvac_device_repository.dart';
import 'package:hvac/core/entities/hvac_device.dart';
import 'package:hvac/main.dart';

class LocalHvacDeviceRepository implements HvacDeviceRepository {
  final _hvacDeviceDao = database.hvacDeviceDao;

  @override
  Future<List<HvacDevice>> findAllDevices() async {
    return _hvacDeviceDao.findAllDevices();
  }

  @override
  Future<HvacDevice?> findDeviceById(int id) {
    return _hvacDeviceDao.findDeviceById(id);
  }

  @override
  Future<void> insertDevice(HvacDevice device) async {
    _hvacDeviceDao.insertDevice(device);
  }

  @override
  Future<void> updateDevice(HvacDevice device) async {
    _hvacDeviceDao.updateDevice(device);
  }

  @override
  Future<void> deleteDevice(HvacDevice device) async {
    _hvacDeviceDao.deleteDevice(device);
  }
}

/*class HvacDeviceRepository {
  final List<HvacDevice> hvacDeviceList = [
    HvacDevice(
        id: 1,
        name: 'Living',
        isOnline: true,
        status: true,
        temp: 23.0,
        setpoint: 22.0,
        mode: 'cool',
        fan: 'low',
        type: 'wall',
        img: 'assets/images/wall.png'),
    HvacDevice(
        id: 2,
        name: 'Habitación',
        isOnline: true,
        status: true,
        temp: 23.0,
        setpoint: 25.0,
        mode: 'heat',
        fan: 'high',
        type: 'ducted',
        img: 'assets/images/ducted.png'),
    HvacDevice(
        id: 3,
        name: 'Cocina',
        isOnline: false,
        status: true,
        temp: 23.0,
        setpoint: 24.0,
        mode: 'cool',
        fan: 'high',
        type: 'cassete',
        img: 'assets/images/cassette.png'),
  ];

  Future<List<HvacDevice>> getHvacDevices() async {
    await Future.delayed(const Duration(seconds: 2));
    return hvacDeviceList;
  }

  Future<HvacDevice?> getHvacDeviceById(int id) async {
    await Future.delayed(const Duration(seconds: 1));
    return hvacDeviceList.firstWhereOrNull((element) => element.id == id);
  }
}*/
