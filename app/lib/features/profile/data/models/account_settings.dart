import 'package:design_system/design_system.dart';
import 'package:equatable/equatable.dart';

/// How readily the person lets the partner see a heavy-day notice.
enum HeavyDaySharing() {
  off,
  ask,
  always;

  static HeavyDaySharing fromServer(String value) => switch (value) {
    'off' => off,
    'ask' => ask,
    'always' => always,
    _ => off,
  };

  String get toServer => switch (this) {
    off => 'off',
    ask => 'ask',
    always => 'always',
  };
}

final class const AccountSettings({
  required final AppThemeVariant theme,
  final String profileId = '',
  final String timeZone = 'UTC',
  final String? partnerName,
  final DateTime? togetherSince,
  final DateTime? onboardedAt,
  final bool shareReadReceipts = false,
  final bool widgetInDiscreet = false,
  final HeavyDaySharing heavyDaySharing = HeavyDaySharing.off,
  final String? phase,
  final List<String> goals = const [],
  final String locale = 'pt-BR',
}) with Equatable {
  /// Whether the person finished the first profile step.
  bool get isOnboarded => onboardedAt != null;

  @override
  List<Object?> get props => [
    theme,
    profileId,
    timeZone,
    partnerName,
    togetherSince,
    onboardedAt,
    shareReadReceipts,
    widgetInDiscreet,
    heavyDaySharing,
    phase,
    goals,
    locale,
  ];
}
