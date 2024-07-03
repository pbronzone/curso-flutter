import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hvac/core/data/local_hvac_device_repository.dart';
import 'package:hvac/core/data/local_settings_repository.dart';
import 'package:hvac/core/domain/settings_repository.dart';
import 'package:hvac/core/domain/hvac_device_repository.dart';
import 'package:hvac/presentation/viewmodels/notifiers/home_notifier.dart';
import 'package:hvac/presentation/viewmodels/states/home_state.dart';

final hvacDeviceRepositoryProvider = Provider<HvacDeviceRepository>(
  (ref) => LocalHvacDeviceRepository(),
);

final settingsRepositoryProvider = Provider<SettingsRepository>(
  (ref) => LocalSettingsRepository(),
);

final homeViewModelProvider =
    NotifierProvider<HomeNotifier, HomeState>(HomeNotifier.new);
