import 'package:floor/floor.dart';
import 'package:hvac/core/entities/settings.dart';

@dao
abstract class SettingsDao {
  @Query('SELECT * FROM Settings')
  Future<List<Settings>> findAllSettings();

  @Query('SELECT * FROM Settings WHERE id = :id')
  Future<Settings?> findSettingsById(int id);

  @insert
  Future<void> insertSettings(Settings settings);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateSettings(Settings settings);

  @delete
  Future<void> deleteSettings(Settings settings);
}
