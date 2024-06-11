// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  HvacDeviceDao? _hvacDeviceDaoInstance;

  UserDao? _userDaoInstance;

  SettingsDao? _settingsDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `HvacDevice` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `isOnline` INTEGER NOT NULL, `status` INTEGER, `temp` REAL, `setpoint` REAL, `mode` TEXT, `fan` TEXT, `type` TEXT NOT NULL, `img` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `User` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `userName` TEXT NOT NULL, `password` TEXT NOT NULL, `isLoggedIn` INTEGER NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Settings` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `userId` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  HvacDeviceDao get hvacDeviceDao {
    return _hvacDeviceDaoInstance ??= _$HvacDeviceDao(database, changeListener);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }

  @override
  SettingsDao get settingsDao {
    return _settingsDaoInstance ??= _$SettingsDao(database, changeListener);
  }
}

class _$HvacDeviceDao extends HvacDeviceDao {
  _$HvacDeviceDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _hvacDeviceInsertionAdapter = InsertionAdapter(
            database,
            'HvacDevice',
            (HvacDevice item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'isOnline': item.isOnline ? 1 : 0,
                  'status': item.status == null ? null : (item.status! ? 1 : 0),
                  'temp': item.temp,
                  'setpoint': item.setpoint,
                  'mode': item.mode,
                  'fan': item.fan,
                  'type': item.type,
                  'img': item.img
                }),
        _hvacDeviceUpdateAdapter = UpdateAdapter(
            database,
            'HvacDevice',
            ['id'],
            (HvacDevice item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'isOnline': item.isOnline ? 1 : 0,
                  'status': item.status == null ? null : (item.status! ? 1 : 0),
                  'temp': item.temp,
                  'setpoint': item.setpoint,
                  'mode': item.mode,
                  'fan': item.fan,
                  'type': item.type,
                  'img': item.img
                }),
        _hvacDeviceDeletionAdapter = DeletionAdapter(
            database,
            'HvacDevice',
            ['id'],
            (HvacDevice item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'isOnline': item.isOnline ? 1 : 0,
                  'status': item.status == null ? null : (item.status! ? 1 : 0),
                  'temp': item.temp,
                  'setpoint': item.setpoint,
                  'mode': item.mode,
                  'fan': item.fan,
                  'type': item.type,
                  'img': item.img
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<HvacDevice> _hvacDeviceInsertionAdapter;

  final UpdateAdapter<HvacDevice> _hvacDeviceUpdateAdapter;

  final DeletionAdapter<HvacDevice> _hvacDeviceDeletionAdapter;

  @override
  Future<List<HvacDevice>> findAllDevices() async {
    return _queryAdapter.queryList('SELECT * FROM HvacDevice',
        mapper: (Map<String, Object?> row) => HvacDevice(
            id: row['id'] as int?,
            name: row['name'] as String,
            isOnline: (row['isOnline'] as int) != 0,
            status: row['status'] == null ? null : (row['status'] as int) != 0,
            temp: row['temp'] as double?,
            setpoint: row['setpoint'] as double?,
            mode: row['mode'] as String?,
            fan: row['fan'] as String?,
            type: row['type'] as String,
            img: row['img'] as String?));
  }

  @override
  Future<HvacDevice?> findDeviceById(int id) async {
    return _queryAdapter.query('SELECT * FROM HvacDevice WHERE id = ?1',
        mapper: (Map<String, Object?> row) => HvacDevice(
            id: row['id'] as int?,
            name: row['name'] as String,
            isOnline: (row['isOnline'] as int) != 0,
            status: row['status'] == null ? null : (row['status'] as int) != 0,
            temp: row['temp'] as double?,
            setpoint: row['setpoint'] as double?,
            mode: row['mode'] as String?,
            fan: row['fan'] as String?,
            type: row['type'] as String,
            img: row['img'] as String?),
        arguments: [id]);
  }

  @override
  Future<void> insertDevice(HvacDevice device) async {
    await _hvacDeviceInsertionAdapter.insert(device, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateDevice(HvacDevice device) async {
    await _hvacDeviceUpdateAdapter.update(device, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteDevice(HvacDevice device) async {
    await _hvacDeviceDeletionAdapter.delete(device);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userInsertionAdapter = InsertionAdapter(
            database,
            'User',
            (User item) => <String, Object?>{
                  'id': item.id,
                  'userName': item.userName,
                  'password': item.password,
                  'isLoggedIn': item.isLoggedIn ? 1 : 0
                }),
        _userUpdateAdapter = UpdateAdapter(
            database,
            'User',
            ['id'],
            (User item) => <String, Object?>{
                  'id': item.id,
                  'userName': item.userName,
                  'password': item.password,
                  'isLoggedIn': item.isLoggedIn ? 1 : 0
                }),
        _userDeletionAdapter = DeletionAdapter(
            database,
            'User',
            ['id'],
            (User item) => <String, Object?>{
                  'id': item.id,
                  'userName': item.userName,
                  'password': item.password,
                  'isLoggedIn': item.isLoggedIn ? 1 : 0
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<User> _userInsertionAdapter;

  final UpdateAdapter<User> _userUpdateAdapter;

  final DeletionAdapter<User> _userDeletionAdapter;

  @override
  Future<List<User>> findAllUsers() async {
    return _queryAdapter.queryList('SELECT * FROM User',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as int?,
            userName: row['userName'] as String,
            password: row['password'] as String,
            isLoggedIn: (row['isLoggedIn'] as int) != 0));
  }

  @override
  Future<User?> findUserById(int id) async {
    return _queryAdapter.query('SELECT * FROM User WHERE id = ?1',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as int?,
            userName: row['userName'] as String,
            password: row['password'] as String,
            isLoggedIn: (row['isLoggedIn'] as int) != 0),
        arguments: [id]);
  }

  @override
  Future<void> insertUser(User user) async {
    await _userInsertionAdapter.insert(user, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateUser(User user) async {
    await _userUpdateAdapter.update(user, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteUser(User user) async {
    await _userDeletionAdapter.delete(user);
  }
}

class _$SettingsDao extends SettingsDao {
  _$SettingsDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _settingsInsertionAdapter = InsertionAdapter(
            database,
            'Settings',
            (Settings item) =>
                <String, Object?>{'id': item.id, 'userId': item.userId}),
        _settingsUpdateAdapter = UpdateAdapter(
            database,
            'Settings',
            ['id'],
            (Settings item) =>
                <String, Object?>{'id': item.id, 'userId': item.userId}),
        _settingsDeletionAdapter = DeletionAdapter(
            database,
            'Settings',
            ['id'],
            (Settings item) =>
                <String, Object?>{'id': item.id, 'userId': item.userId});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Settings> _settingsInsertionAdapter;

  final UpdateAdapter<Settings> _settingsUpdateAdapter;

  final DeletionAdapter<Settings> _settingsDeletionAdapter;

  @override
  Future<List<Settings>> findAllSettings() async {
    return _queryAdapter.queryList('SELECT * FROM Settings',
        mapper: (Map<String, Object?> row) =>
            Settings(id: row['id'] as int, userId: row['userId'] as int));
  }

  @override
  Future<Settings?> findSettingsById(int id) async {
    return _queryAdapter.query('SELECT * FROM Settings WHERE id = ?1',
        mapper: (Map<String, Object?> row) =>
            Settings(id: row['id'] as int, userId: row['userId'] as int),
        arguments: [id]);
  }

  @override
  Future<void> insertSettings(Settings settings) async {
    await _settingsInsertionAdapter.insert(settings, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateSettings(Settings settings) async {
    await _settingsUpdateAdapter.update(settings, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteSettings(Settings settings) async {
    await _settingsDeletionAdapter.delete(settings);
  }
}
