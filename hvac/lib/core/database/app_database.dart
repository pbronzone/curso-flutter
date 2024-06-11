// database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:hvac/core/data/hvac_device_dao.dart';
import 'package:hvac/core/data/settings_dao.dart';
import 'package:hvac/core/data/user_dao.dart';
import 'package:hvac/core/entities/hvac_device.dart';
import 'package:hvac/core/entities/settings.dart';
import 'package:hvac/core/entities/user.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [HvacDevice, User, Settings])
abstract class AppDatabase extends FloorDatabase {
  HvacDeviceDao get hvacDeviceDao;
  UserDao get userDao;
  SettingsDao get settingsDao;
}
