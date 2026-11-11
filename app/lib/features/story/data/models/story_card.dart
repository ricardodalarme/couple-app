import 'package:equatable/equatable.dart';

/// The longest line a person can add to the image.
const int storyPhraseMaxLength = 80;

/// What the shareable image shows; names and a phrase appear only when chosen.
final class const StoryCard({
  required final int daysTogether,
  required final int years,
  required final int months,
  final String? names,
  final String? phrase,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() => const StoryCard(daysTogether: 1000, years: 2, months: 9);

  @override
  List<Object?> get props => [daysTogether, years, months, names, phrase];
}
