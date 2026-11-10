part of 'settings_home_cubit.dart';

final class const SettingsHomeState({
  final bool isLoaded = false,
  final String? partnerName,
  final bool? hasPartner,
  final bool? hasPlus,
  final bool? notificationsOn,
}) with Equatable {
  @override
  List<Object?> get props => [isLoaded, partnerName, hasPartner, hasPlus, notificationsOn];
}
