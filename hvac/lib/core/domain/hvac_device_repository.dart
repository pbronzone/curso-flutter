import 'package:hvac/core/entities/hvac_device.dart';

abstract interface class HvacDeviceRepository {
  Future<List<HvacDevice>> findAllDevices();
  Future<HvacDevice?> findDeviceById(int id);
  Future<void> insertDevice(HvacDevice device);
  Future<void> updateDevice(HvacDevice device);
  Future<void> deleteDevice(HvacDevice device);
}
