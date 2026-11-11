import 'package:equatable/equatable.dart';

/// The notification types a person can switch off one by one, matching the server type keys.
const List<String> notificationTypes = [
  'card_ready',
  'card_received',
  'card_reaction',
  'daily_idea',
  'date_coming',
];

/// What the person chose for notifications, kept on the server so it applies to pushes.
final class const NotificationPreferences({
  final bool isEnabled = true,
  final bool discreet = false,
  final Set<String> mutedTypes = const {},
  final int cardDay = 0,
  final int cardHour = 9,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() => const NotificationPreferences();

  /// Whether [type] is switched on.
  bool allows(String type) => !mutedTypes.contains(type);

  NotificationPreferences copyWith({
    bool? isEnabled,
    bool? discreet,
    Set<String>? mutedTypes,
    int? cardDay,
    int? cardHour,
  }) => NotificationPreferences(
    isEnabled: isEnabled ?? this.isEnabled,
    discreet: discreet ?? this.discreet,
    mutedTypes: mutedTypes ?? this.mutedTypes,
    cardDay: cardDay ?? this.cardDay,
    cardHour: cardHour ?? this.cardHour,
  );

  @override
  List<Object?> get props => [isEnabled, discreet, mutedTypes, cardDay, cardHour];
}
