import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hvac/core/domain/hvac_device_repository.dart';
import 'package:hvac/presentation/utils/base_state.dart';
import 'package:hvac/presentation/viewmodels/providers.dart';
import 'package:hvac/presentation/viewmodels/states/home_state.dart';

class HomeNotifier extends Notifier<HomeState> {
  late final HvacDeviceRepository hvacDeviceRepository =
      ref.read(hvacDeviceRepositoryProvider);

  @override
  HomeState build() {
    return HomeState();
  }

  Future<void> fetchDevices() async {
    state = state.copyWith(
      screenState: BaseState.loading,
      hvacDeviceList: const [],
      error: null,
    );
    await refreshDevices();
  }

  Future<void> refreshDevices() async {
    try {
      final devices = await hvacDeviceRepository.findAllDevices();
      state = state.copyWith(
        screenState: BaseState.idle,
        hvacDeviceList: devices,
      );
    } catch (error) {
      state = state.copyWith(
        screenState: BaseState.error,
        error: error.toString(),
      );
    }
  }
}
