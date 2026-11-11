part of 'heavy_day_cubit.dart';

final class const HeavyDaySetup({
  required final String profileId,
  required final bool hasConsent,
  required final HeavyDaySharing sharing,
  final String? partnerName,
}) with Equatable {
  HeavyDaySetup copyWith({bool? hasConsent, HeavyDaySharing? sharing, String? partnerName}) =>
      HeavyDaySetup(
        profileId: profileId,
        hasConsent: hasConsent ?? this.hasConsent,
        sharing: sharing ?? this.sharing,
        partnerName: partnerName ?? this.partnerName,
      );

  @override
  List<Object?> get props => [profileId, hasConsent, sharing, partnerName];
}

final class const HeavyDayState({
  final Resource<HeavyDaySetup> setup = const Loading(),
  final Resource<void> action = const Initial(),
  final bool isSent = false,
}) with Equatable {
  HeavyDaySetup? get currentSetup => switch (setup) {
    Success(:final value) => value,
    _ => null,
  };

  HeavyDayState copyWith({Resource<HeavyDaySetup>? setup, Resource<void>? action, bool? isSent}) =>
      HeavyDayState(
        setup: setup ?? this.setup,
        action: action ?? this.action,
        isSent: isSent ?? this.isSent,
      );

  @override
  List<Object?> get props => [setup, action, isSent];
}
