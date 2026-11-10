import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_starter/features/reminders/data/models/reminder_preferences.dart';

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
  final Set<String> mutedTypes = const {},
  final TimeOfDayValue quietStart = const TimeOfDayValue(hour: 22, minute: 0),
  final TimeOfDayValue quietEnd = const TimeOfDayValue(hour: 8, minute: 0),
  final int cardDay = 0,
  final int cardHour = 9,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() => const NotificationPreferences();

  /// Whether [type] is switched on.
  bool allows(String type) => !mutedTypes.contains(type);

  /// Whether quiet hours cross midnight.
  bool get crossesMidnight => quietStart.minutes > quietEnd.minutes;

  NotificationPreferences copyWith({
    bool? isEnabled,
    Set<String>? mutedTypes,
    TimeOfDayValue? quietStart,
    TimeOfDayValue? quietEnd,
    int? cardDay,
    int? cardHour,
  }) => NotificationPreferences(
    isEnabled: isEnabled ?? this.isEnabled,
    mutedTypes: mutedTypes ?? this.mutedTypes,
    quietStart: quietStart ?? this.quietStart,
    quietEnd: quietEnd ?? this.quietEnd,
    cardDay: cardDay ?? this.cardDay,
    cardHour: cardHour ?? this.cardHour,
  );

  @override
  List<Object?> get props => [isEnabled, mutedTypes, quietStart, quietEnd, cardDay, cardHour];
}
