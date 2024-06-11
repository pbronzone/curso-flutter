import 'package:hvac/core/entities/settings.dart';
import 'package:hvac/main.dart';

class SettingRepository {
  final _settingsDao = database.settingsDao;

  Future<List<Settings>> findAllSettings() async {
    await Future.delayed(const Duration(seconds: 5));
    return _settingsDao.findAllSettings();
  }

  Future<Settings?> findSetttingById(int id) {
    return _settingsDao.findSettingsById(id);
  }

  Future<void> insertSettings(Settings settings) async {
    _settingsDao.insertSettings(settings);
  }

  Future<void> updateSettings(Settings settings) async {
    _settingsDao.updateSettings(settings);
  }

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
