import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_starter/features/dates/data/models/important_date_kind.dart';
import 'package:flutter_bloc_starter/features/gifts/data/models/gift_idea_status.dart';

/// The days before a date that a reminder is sent, offered as choices.
const List<int> remindDayOptions = [30, 7, 1, 0];

/// The longest title the server accepts for a date or a gift idea.
const int dateTitleMaxLength = 120;

/// An important date; [year] is unknown when null, and the date then repeats without an age.
final class const ImportantDate({
  required final String id,
  required final String title,
  required final ImportantDateKind kind,
  required final int month,
  required final int day,
  final int? year,
  final bool isYearly = true,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() => const ImportantDate(
    id: 'fake',
    title: 'Aniversário',
    kind: ImportantDateKind.birthday,
    month: 5,
    day: 12,
  );

  @override
  List<Object?> get props => [id, title, kind, month, day, year, isYearly];
}

/// A gift idea, private to the person.
final class const GiftIdea({
  required final String id,
  required final String title,
  required final GiftIdeaStatus status,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() =>
      const GiftIdea(id: 'fake', title: 'Livro de poemas', status: GiftIdeaStatus.idea);

  bool get isGiven => status == GiftIdeaStatus.given;

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
