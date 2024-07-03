import 'package:hvac/core/entities/settings.dart';

abstract interface class SettingsRepository {
  Future<List<Settings>> findAllSettings();
  Future<Settings?> findSetttingById(int id);
  Future<void> insertSettings(Settings settings);
  Future<void> updateSettings(Settings settings);
  Future<void> deleteSettings(Settings settings);
}
