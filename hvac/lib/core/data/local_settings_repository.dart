import 'package:hvac/core/domain/settings_repository.dart';
import 'package:hvac/core/entities/settings.dart';
import 'package:hvac/main.dart';

class LocalSettingsRepository implements SettingsRepository {
  final _settingsDao = database.settingsDao;

  @override
  Future<List<Settings>> findAllSettings() async {
    await Future.delayed(const Duration(seconds: 5));
    return _settingsDao.findAllSettings();
  }

  @override
  Future<Settings?> findSetttingById(int id) {
    return _settingsDao.findSettingsById(id);
  }

  @override
  Future<void> insertSettings(Settings settings) async {
    _settingsDao.insertSettings(settings);
  }

  @override
  Future<void> updateSettings(Settings settings) async {
    _settingsDao.updateSettings(settings);
  }

  @override
  Future<void> deleteSettings(Settings settings) async {
    _settingsDao.deleteSettings(settings);
  }

  Future<void> defaultSettings() async {
    _settingsDao.insertSettings(Settings(
      id: 1,
      userId: -1,
    ));
  }
}
