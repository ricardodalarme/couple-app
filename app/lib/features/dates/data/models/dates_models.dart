import 'package:equatable/equatable.dart';

/// The kinds of date a person can add by hand, matching the server kinds.
const List<String> dateKinds = ['relationship', 'birthday', 'first', 'trip', 'reunion', 'custom'];

/// The days before a date that a reminder is sent, offered as choices.
const List<int> remindDayOptions = [30, 7, 1, 0];

/// The longest title the server accepts for a date or a gift idea.
const int dateTitleMaxLength = 120;

/// An important date; [year] is unknown when null, and the date then repeats without an age.
final class const ImportantDate({
  required final String id,
  required final String title,
  required final String kind,
  required final int month,
  required final int day,
  final int? year,
  final bool isYearly = true,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() =>
      const ImportantDate(id: 'fake', title: 'Aniversário', kind: 'birthday', month: 5, day: 12);

  @override
  List<Object?> get props => [id, title, kind, month, day, year, isYearly];
}

/// A gift idea, private to the person.
final class const GiftIdea({
  required final String id,
  required final String title,
  required final String status,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() => const GiftIdea(id: 'fake', title: 'Livro de poemas', status: 'idea');

  bool get isGiven => status == 'given';

  @override
  List<Object?> get props => [id, title, status];
}

/// A holiday from the editorial calendar that the person can add to their dates.
final class const Holiday({
  required final String slug,
  required final String title,
  required final int month,
  required final int day,
}) with Equatable {
  @override
  List<Object?> get props => [slug, title, month, day];
}

/// Whether [day] exists in [month]; February 29 is allowed because the date repeats yearly.
bool isValidMonthDay(int month, int day) {
  const lengths = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

  return month >= 1 && month <= 12 && day >= 1 && day <= lengths[month - 1];
}
