part of 'settings_home_cubit.dart';

final class const SettingsHomeState({
  final bool isLoaded = false,
  final String? partnerName,
  final bool? hasPartner,
  final bool? hasPlus,
  final bool? notificationsOn,
  final bool discreetOn = false,
  final DateTime? deletionPurgeAfter,
}) with Equatable {
  bool get deletionPending => deletionPurgeAfter != null;
  @override
  List<Object?> get props => [
    isLoaded,
    partnerName,
    hasPartner,
    hasPlus,
    notificationsOn,
    discreetOn,
    deletionPurgeAfter,
  ];
}
