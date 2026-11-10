import 'package:equatable/equatable.dart';

/// The kinds of reminder a person can switch on or off.
enum ReminderKind() {
  dailyIdea,
  dates,
  weeklyCard,
}

/// A time of day, without a date.
final class const TimeOfDayValue({required final int hour, required final int minute})
    with Equatable {
  factory fromMap(Map<String, dynamic> map) =>
      TimeOfDayValue(hour: map['hour'] as int, minute: map['minute'] as int);

  /// Minutes since midnight.
  int get minutes => hour * 60 + minute;

  Map<String, dynamic> toMap() => <String, dynamic>{'hour': hour, 'minute': minute};

  @override
  List<Object?> get props => [hour, minute];
}

/// What the person chose for reminders on this device.
final class const ReminderPreferences({
  final Set<ReminderKind> enabled = const {
    ReminderKind.dailyIdea,
    ReminderKind.dates,
    ReminderKind.weeklyCard,
  },
  final int maxPerDay = 2,
  final TimeOfDayValue quietStart = const TimeOfDayValue(hour: 22, minute: 0),
  final TimeOfDayValue quietEnd = const TimeOfDayValue(hour: 8, minute: 0),
  final bool isPaused = false,
  final bool isDiscreet = false,
}) with Equatable {
  factory fromMap(Map<String, dynamic> map) => ReminderPreferences(
    enabled: {
      for (final name in (map['enabled'] as List<dynamic>? ?? const []).cast<String>())
        ...ReminderKind.values.where((kind) => kind.name == name),
    },
    maxPerDay: (map['maxPerDay'] as int? ?? 2).clamp(1, 2),
    quietStart: map['quietStart'] == null
        ? const TimeOfDayValue(hour: 22, minute: 0)
        : TimeOfDayValue.fromMap(map['quietStart'] as Map<String, dynamic>),
    quietEnd: map['quietEnd'] == null
        ? const TimeOfDayValue(hour: 8, minute: 0)
        : TimeOfDayValue.fromMap(map['quietEnd'] as Map<String, dynamic>),
    isPaused: map['isPaused'] as bool? ?? false,
    isDiscreet: map['isDiscreet'] as bool? ?? false,
  );

  ReminderPreferences copyWith({
    Set<ReminderKind>? enabled,
    int? maxPerDay,
    TimeOfDayValue? quietStart,
    TimeOfDayValue? quietEnd,
    bool? isPaused,
    bool? isDiscreet,
  }) => ReminderPreferences(
    enabled: enabled ?? this.enabled,
    maxPerDay: (maxPerDay ?? this.maxPerDay).clamp(1, 2),
    quietStart: quietStart ?? this.quietStart,
    quietEnd: quietEnd ?? this.quietEnd,
    isPaused: isPaused ?? this.isPaused,
    isDiscreet: isDiscreet ?? this.isDiscreet,
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    'enabled': [for (final kind in enabled) kind.name],
    'maxPerDay': maxPerDay,
    'quietStart': quietStart.toMap(),
    'quietEnd': quietEnd.toMap(),
    'isPaused': isPaused,
    'isDiscreet': isDiscreet,
  };

  @override
  List<Object?> get props => [enabled, maxPerDay, quietStart, quietEnd, isPaused, isDiscreet];
}
