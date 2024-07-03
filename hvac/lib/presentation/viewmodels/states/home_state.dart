import 'package:hvac/core/entities/hvac_device.dart';
import 'package:hvac/presentation/utils/base_state.dart';

class HomeState {
  final BaseState screenState;
  final String? error;
  final List<HvacDevice> hvacDeviceList;

  HomeState({
    this.screenState = BaseState.idle,
    this.error,
    this.hvacDeviceList = const [],
  });

  HomeState copyWith({
    BaseState? screenState,
    String? error,
    List<HvacDevice>? hvacDeviceList,
  }) {
    return HomeState(
        screenState: screenState ?? this.screenState,
        error: error ?? this.error,
        hvacDeviceList: hvacDeviceList ?? this.hvacDeviceList);
  }

  bool get isEmpty {
    return hvacDeviceList.isEmpty;
  }
}
