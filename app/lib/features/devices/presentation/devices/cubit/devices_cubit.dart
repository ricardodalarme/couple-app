import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/devices/data/models/device.dart';
import 'package:flutter_bloc_starter/features/devices/data/repositories/devices_repository.dart';

part 'devices_state.dart';

class DevicesCubit({required final DevicesRepository _repository}) extends Cubit<DevicesState> {
  this : super(const DevicesState());

  Future<void> load() async {
    emit(state.copyWith(devices: const Loading()));
    try {
      emit(state.copyWith(devices: Success(await _repository.getDevices())));
    } catch (exception) {
      emit(state.copyWith(devices: Failure.fromObject(exception)));
    }
  }

  /// Stops notifications on one device; the current device and an in-flight revoke are ignored.
  Future<void> revoke(Device device) async {
    final devices = state.devices;
    if (device.isCurrent || state.revokeAction.isLoading) return;
    if (devices is! Success<List<Device>>) return;

    final previous = devices.value;
    emit(state.copyWith(revokeAction: const Loading()));
    try {
      await _repository.revokeDevice(device.id);
      emit(
        state.copyWith(
          devices: Success([...previous.where((item) => item.id != device.id)]),
          revokeAction: const Success(null),
        ),
      );
    } catch (exception) {
      emit(state.copyWith(devices: Success(previous), revokeAction: Failure.fromObject(exception)));
    }
  }
}
