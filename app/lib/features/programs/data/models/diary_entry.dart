import 'package:equatable/equatable.dart';

/// The longest journal text the server accepts.
const int journalBodyMaxLength = 5000;

/// The moods offered in the diary; the stored token stays stable across languages.
const List<String> diaryMoods = ['calm', 'tender', 'tired', 'heavy'];

/// One private journal entry written by the person.
final class const DiaryEntry({
  required final String id,
  required final DateTime entryDate,
  required final String body,
  final String? mood,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() => DiaryEntry(
    id: 'fake',
    entryDate: DateTime(2026),
    body: 'Hoje eu me senti em paz.',
    mood: 'calm',
  );

  /// Whether the entry was written on the same calendar day as [day].
  bool isOn(DateTime day) =>
      entryDate.year == day.year && entryDate.month == day.month && entryDate.day == day.day;

  @override
  List<Object?> get props => [id, entryDate, body, mood];
}
