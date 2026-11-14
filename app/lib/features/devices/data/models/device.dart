import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_starter/features/devices/data/models/device_platform.dart';

/// A device registered to receive notifications; the registration marker stays out of the model.
final class const Device({
  required final String id,
  required final DevicePlatform platform,
  required final DateTime lastSeenAt,
  final String? label,
  final bool isCurrent = false,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() =>
      Device(id: 'fake', platform: DevicePlatform.ios, label: 'iPhone', lastSeenAt: DateTime(2026));

  @override
  List<Object?> get props => [id, platform, label, lastSeenAt, isCurrent];
}
