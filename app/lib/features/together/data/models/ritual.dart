import 'package:equatable/equatable.dart';

/// How often a ritual repeats, matching the server cadences.
const List<String> ritualCadences = ['daily', 'weekly', 'biweekly', 'monthly'];

/// The longest ritual title the server accepts.
const int ritualTitleMaxLength = 80;

/// A small repeated habit the couple wants to protect; there is no streak or score.
final class const Ritual({
  required final String id,
  required final String title,
  required final String cadence,
  final int? weekday,
  final int hour = 19,
  final bool hasReminder = false,
  final DateTime? lastDoneOn,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() =>
      const Ritual(id: 'fake', title: 'Jantar de sexta', cadence: 'weekly', weekday: 5);

  /// Whether the cadence needs a weekday.
  bool get needsWeekday => cadence != 'daily';

  Ritual copyWith({String? title, String? cadence, int? weekday, int? hour, bool? hasReminder}) =>
      Ritual(
        id: id,
        title: title ?? this.title,
        cadence: cadence ?? this.cadence,
        weekday: weekday ?? this.weekday,
        hour: hour ?? this.hour,
        hasReminder: hasReminder ?? this.hasReminder,
        lastDoneOn: lastDoneOn,
      );

  @override
  List<Object?> get props => [id, title, cadence, weekday, hour, hasReminder, lastDoneOn];
}
