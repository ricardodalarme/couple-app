part of 'devices_cubit.dart';

final class const DevicesState({
  final Resource<List<Device>> devices = const Loading(),
  final Resource<void> revokeAction = const Initial(),
}) with Equatable {
  DevicesState copyWith({Resource<List<Device>>? devices, Resource<void>? revokeAction}) =>
      DevicesState(
        devices: devices ?? this.devices,
        revokeAction: revokeAction ?? this.revokeAction,
      );

  @override
  List<Object?> get props => [devices, revokeAction];
}
