import 'package:floor/floor.dart';
import 'package:hvac/core/entities/hvac_device.dart';

@dao
abstract class HvacDeviceDao {
  @Query('SELECT * FROM HvacDevice')
  Future<List<HvacDevice>> findAllDevices();

  @Query('SELECT * FROM HvacDevice WHERE id = :id')
  Future<HvacDevice?> findDeviceById(int id);

  @insert
  Future<void> insertDevice(HvacDevice device);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateDevice(HvacDevice device);

  @delete
  Future<void> deleteDevice(HvacDevice device);
}
